class ConversationsController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    @active_conversations = UserConversations.for(current_user)
  end

  def show
    conversation = current_user.all_conversations.find_by(id: params[:id])

    if conversation
      displayable_messages = DisplayableMessages.new.for_conversation(conversation)

      render json: { messages: displayable_messages }, status: :ok
    else
      render json: { messages: [] }, status: :not_found
    end
  end

  private

  def ensure_user_logged_in
    render file: 'public/404.html', status: 404 unless current_user
  end
end
