class GroupsController < ApplicationController
  def index
    @group = Group.all
    render json: @group
  end

  def show
    @group = Group.find(params[:id])
    render json: @group
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      render json: @group, status: :created, location: @group
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      render json: @group, status: :ok, location: @group
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    head :no_content
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
