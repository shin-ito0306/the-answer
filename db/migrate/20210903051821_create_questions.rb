class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.string :question_image
      t.integer :reword_point
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
