class Api::V1::RegistrationsController < ApplicationController
  def create
    user = User.create!(user_params)

    if user
      session[:user_id] = user.id
      render json: { status: :created, user: user }
      p 'created?'
    else
      p 'not created'
      render json: { status: 500 }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
