class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.profile.present?
      redirect_to root_path
    end
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_path(@profile.user.id)
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    if @profile.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    profile = Profile.find(params[:id])
    profile.update(profile_params)
    redirect_to user_path(profile.user.id)
  end

  private
  
  def profile_params
    params.require(:profile).permit(:icon_image, :header_image, :text).merge(user_id: current_user.id)
  end
end
