class FriendshipsController < ApplicationController

  def index
    @friendship = Friendship.all
    render json: @friendship
  end

  def show
    @friendship = Friendship.find(params[:id])
    render json: @friendship
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      render json: @friendship, status: :created, location: @friendship
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    @friendship = Friendship.find(params[:id])
    if @friendship.update(friendship_params)
      render json: @friendship, status: :ok, location: @friendship
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    head :no_content
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :status)
  end
end
