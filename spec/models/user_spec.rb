require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    befor do
      @user = FactoryBot.build(:user)
    end
