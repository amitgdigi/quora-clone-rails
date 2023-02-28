class Question < ApplicationRecord
  belongs_to :user
  has_many :answers ,dependent: :destroy
  has_many :question_topics
  has_many :topic, through: :question_topics
  validates :topic, presence: true
  validates :question, presence: true
end
