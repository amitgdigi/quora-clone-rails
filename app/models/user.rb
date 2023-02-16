class User < ApplicationRecord
  has_many :questions , dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :follows
  has_many :topic, through: :follows

  has_many :following_user, class_name: 'Relationship', foreign_key: :followed_id
  has_many :following, through: :following_user

  has_many :followed_user, class_name: 'Relationship', foreign_key: :following_id
  has_many :followed, through: :followed_user

  # belongs_to :following
  # belongs_to :followed

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
