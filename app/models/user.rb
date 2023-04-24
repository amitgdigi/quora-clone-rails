class User < ApplicationRecord
  has_many :questions , dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :follows
  has_many :topic, through: :follows

  has_many :following_user, class_name: 'Relationship', foreign_key: :followed_id
  has_many :following, through: :following_user

  has_many :followed_user, class_name: 'Relationship', foreign_key: :following_id
  has_many :followed, through: :followed_user

  has_one_attached :avatar
  # after_commit :add_default_avatar, only: %i[:create, :update]
  validates :avatar, size: {less_than: 5.megabytes , message: "Image size exceeds 5mb limitation"}
  # , image: {image.include?(".jpef") || image.include?(".gif"), message: "Image only supports jpg, gif, png"}
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def avatar_thumbnail
      if avatar.attached?
        (avatar.variant(resize_to_fit: [50, 50]).processed)
      else
        "avatar2.jpg"
      end
    end

    private
    # def add_default_avatar
    #   unless avatar.attached?
    #     # byebug
    #     avatar.attach(io: Rails.root.join('app','assets','images','avatar2.jpg'),
    #       # File.open( Rails.root.join('app','assets','images','avatar2.jpg'),
    #       filename: 'avatar2.jpg',
    #       content_type: 'image/jpg') 

    #       # File.open(
    #       #   Rails.root.join(
    #       #     'app','assets','images','avatar2.jpg'
    #       #   ),filename: 'avatar2.jpg',
    #       #   content_type: 'image/jpg')
    #     # )
    #   end
    # end
end
