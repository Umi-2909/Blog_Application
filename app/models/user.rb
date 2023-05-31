class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar
  def total_post
    count = 0  # Create an empty array
    # Logic find post's number of users
    posts = Post.where(user_id: self.id)
    count = posts.count
    return count
  end
  def make_admin
    update(admin: true)
  end
end
