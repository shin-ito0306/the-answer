class ChangeColumnDefaultUers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :point, 0
  end
end
