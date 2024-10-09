class DomainsController < ApplicationController
  before_action :authenticate_user!
  before_action :domain, only: [:show]
  before_action :authorize_domain, only: [:show]

  def index
    @domains = policy_scope(Domain)
    render json: @domains
  end

  def show
    render json: @domain
  end

  private

  def domain
    @domain ||= Domain.find(params[:id])
  end

  def authorize_domain
    authorize domain
  end

end
