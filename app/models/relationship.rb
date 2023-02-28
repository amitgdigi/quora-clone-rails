class Relationship < ApplicationRecord
    belongs_to :following, class_name: "User"
    belongs_to :followed, class_name: "User"
    validates :following, uniqueness: {scope: :followed, message:"User is already followed"}
end
