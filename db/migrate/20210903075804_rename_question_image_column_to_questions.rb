class RenameQuestionImageColumnToQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :question_image, :question_image_id
  end
end
