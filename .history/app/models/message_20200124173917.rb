class Message < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :text, presence: true
  has_many :liked_users, through: :likes, source: :user
end
