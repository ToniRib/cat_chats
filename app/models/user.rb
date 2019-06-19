class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name, :last_name, :username
  validates_uniqueness_of :username

  def display_name
    "#{first_name} #{last_name}"
  end
end
