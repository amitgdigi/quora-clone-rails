class Question < ApplicationRecord
  belongs_to :user
  has_many :answers ,dependent: :destroy
  belongs_to :topic
  validates :question, presence: true
end
