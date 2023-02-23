class Topic < ApplicationRecord
    # belongs_to :user
    has_many :questions
    # validates_presence_of :topic, message: "topic cantj be blank"
    validates :topic , presence: {message: "Topic cant be blank"}, uniqueness: {message: "topic is already present"}
    has_many :follows
    has_many :user, through: :follows
    has_many :question_topics
    has_many :question, through: :question_topics
end
