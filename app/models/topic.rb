class Topic < ApplicationRecord
    # belongs_to :user
    has_many :questions
    validates :topic , presence: true, uniqueness: true
end
