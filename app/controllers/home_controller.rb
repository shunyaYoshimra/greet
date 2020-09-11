class HomeController < ApplicationController
  def top
    @users = User.order(created_at: :desc)
  end
end
