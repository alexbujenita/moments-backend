# Messages controller class
class MessagesController < ApplicationController
  def create
    Message.create!(content: params[:content], user_id: params[:user_id])
    render json: { ok: true }
  end
end
