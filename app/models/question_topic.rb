class QuestionTopic < ApplicationRecord
  belongs_to :question
  belongs_to :topic
  validates :question, uniqueness: {scope: :topic , message: "uniqeness is violated"}
end
