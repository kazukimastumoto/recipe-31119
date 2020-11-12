class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, length: { maximum: 7 }

  has_many :recipes, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(recipe_id)
    likes.where(recipe_id: recipe_id).exists?
  end
end
