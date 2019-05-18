class MessagesController < ApplicationController
  def create
    message = Message.create!(content: params[:content], user_id: params[:user_id])
    render json: { ok: true }
  end
end
