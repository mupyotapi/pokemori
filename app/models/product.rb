class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reviews              #reviewsテーブルとのアソシエーション

  def review_average
    reviews.average(:rate).round
  end
end
