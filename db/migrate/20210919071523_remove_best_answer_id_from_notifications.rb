class RemoveBestAnswerIdFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :best_answer_id, :integer
  end
end
