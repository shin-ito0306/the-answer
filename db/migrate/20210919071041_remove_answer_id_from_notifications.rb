class RemoveAnswerIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :answer_id, :integer
  end
end
