class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :company, only: [:show] 
  before_action :authorize_company, only: [:show]

  def index
    @companies = policy_scope(Company)
    render json: @companies
  end

  def show
    render json: company
  end

  private

  def company
    @company ||= Company.find(params[:id])
  end

  def authorize_company
    authorize company
  end

end
