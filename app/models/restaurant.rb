class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :name, length: { minimum: 3}, uniqueness: true

  def build_review(review_params, user)
    review_params[:user] ||= user
    reviews.new(review_params)
  end
end
