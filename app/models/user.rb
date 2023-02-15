class User < ApplicationRecord
  has_many :questions , dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :follows
  has_many :topic, through: :follows
  # has_many :topics
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def follow(topic)
  #   byebug
  #   # following << topic
  # end

  # def unfollow(topic)
  #   byebug
  #   following.delete(topic)
  # end

  # def following?(topic)
  #   byebug
  #   following.include?(topic)
  # end

end
