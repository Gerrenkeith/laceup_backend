class UsersController < ApplicationController
  def index
    @user = User.all
    render json: @user
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user, status: :ok, location: @user
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :email, :username)
  end
end
