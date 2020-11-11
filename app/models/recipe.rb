class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :price, :body, :image, presence: true
  validates :title, presence: true, length: { maximum: 20 }
end
