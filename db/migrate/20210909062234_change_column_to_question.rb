class ChangeColumnToQuestion < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :accepting, :boolean, default: true, null: false
  end
end
