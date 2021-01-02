class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to new_profile_path
    else
      render :new
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:profile_image, :header_image, :text).merge(user_id: current_user.id)
  end
end
