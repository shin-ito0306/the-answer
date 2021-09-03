class Question < ApplicationRecord
  belongs_to :user

  attachment :question_image
end
