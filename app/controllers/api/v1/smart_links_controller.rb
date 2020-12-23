class Api::V1::SmartLinksController < ApplicationController
  include CurrentUserConcern
  before_action :set_smart_link, only: %i[show edit update destroy]

  def index
    smart_links = SmartLink.all
    render json: smart_links
  end

  def show
    smart_link = SmartLink.find(params[:id])
    render json: { smart_link: smart_link }
  end

  def create
    smart_link = SmartLink.create(smart_link_params)
    user = User.find(params[:user_id])
    smart_link.user_email = user.email
    smart_link.save
    minutes = Time.now.to_f * 1000
    smart_link.minutes = minutes.to_i
    smart_link.save
    if smart_link
      render json: { smart_link: smart_link, status: :created }
    else
      render json: { status: 401 }
    end
  end

  def edit
    smart_link = SmartLink.find(params[:id])
    render json: { smart_link: smart_link }
  end

  def update
    smart_link = SmartLink.find(params[:id])
    if smart_link.update(smart_link_params)
      render json: smart_link
    else
      render json: { status: 401 }
    end
  end

  def destroy
    smart_link = SmartLink.find(params[:id])
    smart_link.destroy
    render json: { smart_link: 'destroyed' }
  end

  private

  def set_smart_link
    smart_link = SmartLink.find(params[:id])
  end

  def smart_link_params
    params.require(:smart_link).permit(:name, :url, :user_id)
  end
end
