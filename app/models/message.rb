class Message < ApplicationRecord
  validates_presence_of :body

  belongs_to :user
  belongs_to :conversation
end
