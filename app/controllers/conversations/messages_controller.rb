module Conversations
  class MessagesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :ensure_user_logged_in

    def create
      conversation = current_user.all_conversations.find_by(id: params[:id])

      if conversation
        message = conversation.messages.new(user: current_user, body: params.dig(:message, :body))

        if message.save
          render json: { message: DisplayableMessages.new.single_message(message) }, status: :ok
        else
          render json: { message: nil }, status: :unprocessable_entity
        end
      else
        render json: { message: nil }, status: :not_found
      end
    end

    private

    def ensure_user_logged_in
      render file: 'public/404.html', status: 404 unless current_user
    end
  end
end
