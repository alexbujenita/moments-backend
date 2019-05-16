class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    photos = user.photos
    user = {
      id: user.id,
      name: user.name,
      email: user.email,
      instagram: user.instagram,
      flickr: user.flickr,
      avatar: user.avatar,
      avatar_filename: user.avatar_filename,
      bio: user.bio,
      photos: photos
    }
    render json: user
  end

  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if user.save
      payload = { user_id: user.id }
      token = issue_token(payload)

      render json: { jwt: token }
    else
      render json: { error: 'There was an error.' }
    end
  end

  private

  def users_photos(user)
    user.photos
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
