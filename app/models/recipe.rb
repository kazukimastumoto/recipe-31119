class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :price, :body, :image, presence: true
  validates :title, presence: true, length: { maximum: 20 }

  def self.search(search)
    if search != ""
      Recipe.where('title Like(?)', "%#{search}%")
    else
      Recipe.all
    end
  end
end
