class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show]

  def index
    @reviews = Review.all
  end

  def show
     # @reviews = Review.all
     # @reviews.map do |review|
     #    rating = review.where("restaurant_id = #{params[:restaurant_id]}").rating
     #    content = review.where("restaurant_id = #{params[:restaurant_id]}").content
     #  end
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
