class ConversationsController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    @active_conversations = UserConversations.for(current_user)
  end

  private

  def ensure_user_logged_in
    render file: 'public/404.html', status: 404 unless current_user
  end
end
