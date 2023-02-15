class Topic < ApplicationRecord
    # belongs_to :user
    has_many :questions
    validates :topic , presence: true, uniqueness: true
    has_many :follows
    has_many :user, through: :follows
    # has_many :follows
    # has_many :question, through: :follows
end
