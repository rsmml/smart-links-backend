class Api::V1::RegistrationsController < ApplicationController
  include CurrentUserConcern

  def destroy
    reset_session
    render json: { status: 200, logged_out: true }
  end

  def logged_in
    if @current_user
      render json: { logged_in: true, user: @current_user }
    else
      render json: { logged_in: false }
    end
  end

  def create
    user = User.create(user_params)

    if user
      session[:user_id] = user.id
      render json: { status: :created, user: user }
    else
      render json: { status: 500 }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
