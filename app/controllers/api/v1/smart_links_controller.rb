class Api::V1::SmartLinksController < ApplicationController
  include CurrentUserConcern
  before_action :set_smart_link, only: %i[show edit update destroy]

  def index
    smart_links = SmartLink.all
    render json: smart_links
  end

  def show
    render json: smart_link
  end

  def create
    smart_link = SmartLink.create(smart_link_params)
    smart_link.user_id = @current_user.id
    if smart_link.save
      render json: { smart_link: smart_link, status: :created }
    else
      render json: { status: 401 }
    end
  end

  def edit
    render json: smart_link
  end

  def update
    if smart_link.update(smart_link_params)
      render json: smart_link
    else
      render json: { status: 401 }
    end
  end

  def my_links
    user = @current_user
    smart_links = SmartLink.all.where(user_id: user.id)
    render json: { smart_links: smart_links }
  end

  private

  def set_smart_link
    smart_link = SmartLink.find(params[:id])
  end

  def smart_link_params
    params.require(:smart_link).permit(:name, :url)
  end
end
