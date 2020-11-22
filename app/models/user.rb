class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :nickname, presence: true, length: { maximum: 7 }
  validates :email, uniqueness: true

  has_many :recipes, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_recipes, through: :likes, source: :recipe
  has_many :sns_credentials

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  def liked_by?(recipe_id)
    likes.where(recipe_id: recipe_id).exists?
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
      if user.persisted?
        sns.user = user
        sns.save
      end
      user
  end
end
