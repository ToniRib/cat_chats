class DisplayableMessages
  def for_conversation(conversation)
    conversation.messages.order(:created_at).map do |message|
      present_message(message)
    end
  end

  def single_message(message)
    present_message(message)
  end

  private

  def present_message(message)
    {
      id: message.id,
      displayName: message.user.display_name,
      body: message.body,
      timeSent: message.created_at.strftime('%a, %b %-d %Y @%l:%M%P'),
    }
  end
end
