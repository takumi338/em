class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @match = current_user.matches.page(params[:page]).per(5).order("created_at DESC")
  end
end
