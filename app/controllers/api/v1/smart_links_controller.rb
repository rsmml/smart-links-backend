class Api::V1::SmartLinksController < ApplicationController
  include CurrentUserConcern
  before_action :set_smart_link, only: %i[show edit update destroy]

  def index
    smart_links = SmartLink.all
    # language_rules = smart_links.map { |smart_link| smart_link.language_rules }

    render json: { smart_links: smart_links }
  end

  def show
    smart_link = SmartLink.find(params[:id])
    render json: { smart_link: smart_link }
  end

  def create
    if params[:es_name] != '' && params[:es_url] != '' && params[:de_url] != '' && params[:de_name] != ''
      smart_link = SmartLink.create(smart_link_params)
      user = User.find(params[:user_id])
      smart_link.user_email = user.email
      smart_link.save
      minutes = Time.now.to_f * 1000
      smart_link.minutes = minutes.to_i
      smart_link.save
      es_rule = LanguageRule.create!(name: params[:es_name], url: params[:es_url], smart_link_id: smart_link.id)
      de_rule = LanguageRule.create!(name: params[:de_name], url: params[:de_url], smart_link_id: smart_link.id)

      if smart_link && es_rule && de_rule
        render json: { smart_link: smart_link, status: :created, es_rule: es_rule, de_rule: de_rule }
      else
        render json: { status: 401 }
      end
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
    params.require(:smart_link).permit(:name, :url, :user_id, :es_name, :es_url, :de_name, :de_url)
  end
end
