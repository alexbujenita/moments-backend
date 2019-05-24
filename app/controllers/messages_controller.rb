# Messages controller class
class MessagesController < ApplicationController
  def create
    Message.create!(content: params[:content], user_id: params[:user_id])
    render json: { ok: true }
  end

  def seen
    message = Message.find(params[:id])
    message.seen = true
    message.save
    user = message.user
    photos = user.photos
    messages = user.messages
    user = {
      id: user.id,
      name: user.name,
      email: user.email,
      instagram: user.instagram,
      flickr: user.flickr,
      avatar: user.avatar,
      avatar_filename: user.avatar_filename,
      bio: user.bio,
      hidden: user.hidden,
      photos: photos,
      messages: messages
    }
    render json: user
  end
end
