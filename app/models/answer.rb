class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_one_attached :attachment
  validates :answer, presence: {message: "Answer cant be blank"}
  validates :attachment, size: { less_than: 4.megabytes, message: "File must be less than 4mb"}
  # attachment validation msg render is left 
end
