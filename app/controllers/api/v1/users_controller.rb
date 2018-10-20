class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  def index
    @users = paginate User.all
    render json: UserSerializer.new(@users)
  end

  def show
    render json: UserSerializer.new(@user)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user), status: :created, location: [:api, :v1, @user]
    else
      render json: { errors: ErrorSerializer.new(@user) }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user)
    else
      render json: { errors: ErrorSerializer.new(@user) }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
