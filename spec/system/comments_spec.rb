require 'rails_helper'

def basic_pass(path) 
  username = ENV["BASIC_AUTH_USER"] 
  password = ENV["BASIC_AUTH_PASSWORD"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe "コメント投稿", type: :system do
  before do
    @item = FactoryBot.create(:item)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは商品詳細ページでコメント投稿できる' do
    # ログインする
    basic_pass new_user_session_path
    fill_in 'メールアドレス', with: @item.user.email
    fill_in 'パスワード', with: @item.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    # 商品詳細ページに遷移する
    visit item_path(@item)
    # フォームに情報を入力する
    fill_in 'comment_text', with: @comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect{
      click_button 'コメントする'
    }.to change { Comment.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq item_path(@item)
    # 詳細ページに先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @comment
  end
end
