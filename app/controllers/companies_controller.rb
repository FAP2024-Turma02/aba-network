class CompaniesController < ApplicationController

  def index
    @companies = policy_scope(Company)
    render json: @companies
  end

  def show
    authorize_company
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
