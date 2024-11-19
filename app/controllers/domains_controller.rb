class DomainsController < ApplicationController
  def index
    @domains = policy_scope(Domain)
    render json: @domains
  end

  def show
    authorize Domain
    render json: domain
  end

  def create
    authorize Domain
    domain = Domain.create(permitted_attributes(Domain))
    company = Company.find(params[:company_id]) 
    domain.companies << company
    render json: DomainSerializer.call(domain), status: :created
  end
  
  def update
    authorize Domain
    domain.update!(permitted_attributes(Domain))  
    render json: DomainSerializer.call(domain), status: :ok
  end

  def destroy
    authorize Domain
    domain.destroy!
    head :no_content
  end
  
  private
  def domain
    @domain ||= Domain.find(params[:id])
  end
end
