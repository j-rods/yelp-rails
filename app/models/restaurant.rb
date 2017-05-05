class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user
  validates :name, length: { minimum: 3}, uniqueness: true
  has_attached_file :image, :styles => { :medium => '300x300', :thumb => '100x100' }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_review(review_params, user)
    review_params[:user] ||= user
    reviews.new(review_params)
  end

  def average_rating
    if reviews.none?
      'N/A'
    else
      reviews.average(:rating)
    end
  end
end
