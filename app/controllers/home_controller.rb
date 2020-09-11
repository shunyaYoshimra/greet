class HomeController < ApplicationController
  def top
    @q = Profile.ransack(params[:q])
    @profiles = @q.result(distinct: true)
  end
end
