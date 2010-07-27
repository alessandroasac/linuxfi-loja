# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  #este é o master
  #este ainda é o master

  helper_method :pedido_atual
  
  protected
  
  def pedido_atual
    unless @pedido_atual
      @pedido_atual = session[:pedido_id].blank? ?
        Pedido.new : Pedido.find( session[:pedido_id] )
    end
  end

  def load_page
    @page = params[:page] || 1
    @per_page = params[:per_page] || 10
    if @per_page.to_i > 30
      @per_page = 30
    end
    @per_page = 2
  end

  def paginate( scope, options = {} )
    load_page
    scope.paginate( { :page => @page, :per_page => @per_page }.merge( options ) )
  end

end