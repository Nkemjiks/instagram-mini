class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  acts_as_votable
  
  validates :description, presence: { message: "can't be blank" }, length: { minimum: 3 }
end
