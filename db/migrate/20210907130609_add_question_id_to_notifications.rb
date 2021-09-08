class AddQuestionIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :question_id, :integer
  end
end
