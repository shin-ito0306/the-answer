class ChangeColumnBestAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :best_answer, :boolean, default: false, null: false
  end
end
