class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])

    render json: generate_user_json(user)
  end

  def edit_avatar
    user = User.find(params[:user_id])
    # byebug
    user.update(avatar: params[:avatar], avatar_filename: params[:avatar_filename])
    render json: generate_user_json(user)
  end

  def visibility
    user = User.find(params[:id])
    user.update(hidden: !user.hidden)
    render json: generate_user_json(user)
  end

  def edit_profile
    user = User.find(params[:user_id])
    user.update(user_params)

    render json: generate_user_json(user)
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

  def generate_user_json(user)
    photos = user.photos
    messages = user.messages
    {
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
  end

  def user_params
    params.require(:user).permit(:name, :email, :flickr, :instagram, :bio)
  end
end
