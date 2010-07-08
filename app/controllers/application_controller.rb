# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  helper_method :pedido_atual
  
  protected
  
  def pedido_atual
    if @pedido_atual.nil? && !session[:pedido_id].blank?
      @pedido_atual = Pedido.find_by_id(sesion[:pedido_id])
    end
    @pedido_atual ||= Pedido.new
  end
end