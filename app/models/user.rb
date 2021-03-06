class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :likes
  has_many :liked_messages, through: :likes, source: :message
  validates :name,    length: { in: 1..5 }, uniqueness: true

  def already_liked?(message)
    self.likes.exists?(message_id: message.id)
  end
end
