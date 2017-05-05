class EndorsementsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @review.endorsements.create
    render json: {new_endorsement_count: @review.endorsements.count}
    redirect_to restaurants_path
  end
end
