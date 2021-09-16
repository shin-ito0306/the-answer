class Notification < ApplicationRecord
  belongs_to :answer, optional: true
  belongs_to :question

  belongs_to :visiter, class_name: "User"
  belongs_to :visited, class_name: "User"

  validates :action, presence: true
  validates :checked, inclusion: { in: [true, false] }

  def confirmed_by_user
    self.where(checked: 0).update_all(checked: 1)
  end
end
