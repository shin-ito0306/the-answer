class RenameContentColumnToQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :content, :question_content
  end
end
