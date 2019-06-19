class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name, :last_name, :username
  validates_uniqueness_of :username

  has_many :conversations, class_name: 'Conversation', foreign_key: :sender_id
  has_many :messages

  def display_name
    "#{first_name} #{last_name}"
  end
end
