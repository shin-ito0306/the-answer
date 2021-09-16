class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :user_image

  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :point, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true

  def current_user?(current_user)
    self == current_user
  end

  def unchecked_notifications
    passive_notifications.where(checked: false)
  end

  def checked_by_user
    unchecked_notifications.update_all(checked: 1)
  end

  def have_unchecked_notification?
    unchecked_notifications.present?
  end
end