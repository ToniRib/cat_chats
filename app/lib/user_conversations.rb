class UserConversations
  def self.for(user)
    user.all_conversations.map do |conversation|
      display_name = conversation.sender_id == user.id ? conversation.receiver.display_name : conversation.sender.display_name

      {
        id: conversation.id,
        displayName: display_name,
      }
    end
  end
end
