class AddAcceptingToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :accepting, :boolean
  end
end
