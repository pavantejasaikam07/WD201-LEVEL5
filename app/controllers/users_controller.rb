class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_UserList }.join("\n")
  end

  def show
    id = params[:id]
    users = User.find(id)
    render plain: users.to_UserList
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    render plain: "Hello New User !!  Your user id is #{new_user.id} with user name #{name}"
  end

  def login
    email = params[:email]
    password = params[:password]
    is_login = User.where(email: email, password: password).exists? ? true : false
    render plain: is_login
  end
end
