class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :price, :body, :image,:material, presence: true
  validates :title, presence: true, length: { maximum: 20 }

  def self.search(search)
    if search != ""
      Recipe.where('title Like(?) OR price Like(?) OR body Like(?) ', "%#{search}%","%#{search}%","%#{search}%")
    else
      Recipe.all
    end
  end

  def create_notification_like!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and recipe_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        recipe_id: id,
        visited_id: user_id,
        action: 'like'
      )

      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
