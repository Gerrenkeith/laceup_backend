class AccessesController < ApplicationController
  def index
    @access = Access.all
    render json: @access
  end

  def show
    @access = Access.find(params[:id])
    render json: @access
  end

  def new
    @access = Access.new
  end

  def create
    @access = Access.new(access_params)
    if @access.save
      render json: @access, status: :created, location: @access
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @access = Access.find(params[:id])
  end

  def update
    @access = Access.find(params[:id])
    if @access.update(access_params)
      render json: @access, status: :ok, location: @access
    else
      render :edit, status: :unprocessable_entity
    end

    def destroy
      @access = Access.find(params[:id])
      @access.destroy

      head :no_content
    end
  end

  private

  def access_params
    params.require(:access).permit(:user_id, :accessable_id, :accessable_type, :access_level)
  end
end
