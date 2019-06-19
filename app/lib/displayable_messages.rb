class DisplayableMessages
  def self.for(conversation)
    conversation.messages.order(:created_at).map do |message|
      {
        id: message.id,
        displayName: message.user.display_name,
        body: message.body,
        timeSent: message.created_at.strftime('%a, %b %-d %Y @%l:%M%P'),
      }
    end
  end
end
