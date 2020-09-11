class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:update, :edit]

  def new
    @profile = Profile.new
  end

  def create
    profile = current_user.build_profile(profile_params)
    if profile.save
      redirect_to root_url, notice: '自己紹介しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_url, notice: '自己紹介を変更しました。'
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:content, :language, :github)
  end
end
