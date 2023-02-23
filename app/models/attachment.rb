class Attachment < ApplicationRecord
  belongs_to :answer
  # validates :attachment, max_size: 4.megabytes
  # validates :attachment, size: {less_than: 7.megabytes, message: "File must be less than 4mb"}
end
