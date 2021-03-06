class PhotosController < ApplicationController
  def create
    Photo.create!(user_id: params['user_id'].to_i, name: params['name'], caption: params['caption'], aws_filename: params['aws_filename'], aws_url: params['aws_url'])
    user = User.find(params['user_id'])
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

  def destroy
    photo = Photo.find(params[:id])
    user = photo.user
    photo.destroy
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
