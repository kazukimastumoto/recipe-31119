class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :price, :body, :title, :image, presence: true
end
