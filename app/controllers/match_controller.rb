class MatchController < ApplicationController
  
  # before_action :move_to_index, except: :index

  def index
    @match = Match.order("created_at DESC")
  end

  def new
  end

  def show
    @match = Match.find(params[:id])
    @comments = Comment.all
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.user_id == current_user.id
      @match.update(match_params)
      redirect_to action: 'index'
    end
  end

  def create
    Match.create(name: match_params[:name], image: match_params[:image], text: match_params[:text], user_id: current_user.id)
  end

  def destroy
    @match = Match.find(params[:id])
    if @match.user_id == current_user.id
      @match.destroy
      redirect_to action: 'index'
    end
  end

  def match_params
    params.permit(:name, :image, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
