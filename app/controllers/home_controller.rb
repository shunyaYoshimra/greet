class HomeController < ApplicationController
  def top
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
end
