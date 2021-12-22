class ApplicationController < ActionController::Base
  include Clearance::Controller

  # rescue_from ActiveRecord::RecordNotFound, :with => :rescue_404
  # rescue_from ActionController::RoutingError, :with => :rescue_404

  # def rescue_404
  #   redirect_to '/'
  # end
end
