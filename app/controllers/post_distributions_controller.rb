class PostDistributionsController < ApplicationController
  def index
    @post_distribution = PostDistribution.all
    render json: @post_distribution
  end

  def show
    @post_distribution = PostDistribution.find(params[:id])
    render json: @post_distribution
  end

  def new
    @post_distribution = PostDistribution.new
  end

  def create
    @post_distribution = PostDistribution.create(post_distribution_params)
  end

  def edit
    @post_distribution = PostDistribution.find(params[:id])
  end

  def update
    @post_distribution = PostDistribution.find(params[:id])
    @post_distribution.update(post_distribution_params)
  end

  def destroy
    @post_distribution = PostDistribution.find(params[:id])
    @post_distribution.destroy
  end

  private
  def post_distribution_params
    params.require(:post_distribution).permit(:post_id, :target_id, :target_type);
  end
end
