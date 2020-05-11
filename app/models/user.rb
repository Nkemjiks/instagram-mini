class User < ApplicationRecord
  has_one_attached :avatar
  has_many :posts
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: { minimum:3 }
  validates :last_name, presence: true, length: { minimum:3 }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
