class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  validates :topic, uniqueness:{scope: :user, message: "User is allready following"}
end
