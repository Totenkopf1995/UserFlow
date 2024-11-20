class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all  # shows all users
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user # shows a single user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity # Error handling
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity # Error handling
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
    head :no_content # deletes the user without sending a status
  end

  def find_by_name
    @user = User.where(name: params[:name])
    render_user_or_error(@user, 'Usuario no encontrado')
    end

  def find_by_email
    @user = User.find_by(email: params[:email])
    render_user_or_error(@user, 'Email no encontrado')
    end

  def find_by_name_and_email
    @user = User.where(name: params[:name],
      email: params[:email])
    render_users_or_error(@users, 'Email o Name no encontrados')
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id]) # searches for a record in the database by its ID.
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def render_user_or_error(
    user,
    error_message
  )
    if user
      render json: user
    else
      render json: { error: error_message },
             status: :not_found
    end
  end

  def render_users_or_error(
    users,
    error_message
  )
    if users.any?
      render json: users
    else
      render json: { error: error_message },
             status: :not_found
    end
  end
end