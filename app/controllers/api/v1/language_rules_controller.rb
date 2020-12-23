class Api::V1::LanguageRulesController < ApplicationController
  before_action :set_language_rule, only: %i[show edit update destroy]

  def index
    language_rules = LanguageRule.where(smart_link_id: params[:smart_link_id])
    render json: language_rules
  end

  def show
    render json: language_rule
  end

  def create
    language_rule = LanguageRule.create(language_rule_params)

    if language_rule
      render json: language_rule, status: :created
    else
      render json: { status: 401 }
    end
  end

  def edit
    render json: language_rule
  end

  def update
    if language_rule.update(language_rule_params)
      render json: language_rule
    else
      render json: { status: 401 }
    end
  end

  private

  def set_language_rule
    language_rule = SmartLink.find(params[:id])
  end

  def language_rule_params
    params.require(:language_rule).permit(:name, :url)
  end
end
