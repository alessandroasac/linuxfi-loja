module AutenticacaoControllerHelper

  protected

  def login_necessario
    unless self.logged_in?
      respond_to do |format|
        format.html do
          flash[:erro] = 'Você precisa estar logado para acessar esta página'
          redirect_to sessao_path
        end
      end
    else
      true
    end
  end

  def administrador_necessario
    if administrador?
      true
    else
      respond_to do |format|
        format.html do
          flash[:erro] = 'Você precisa ser administrador para visualizar esta página'
          redirect_to produtos_path
        end
      end
    end
  end

  def logado?
    self.usuario_atual
  end

  def administrador?
    logado? && self.usuario_atual.administrador?
  end

  def usuario_atual
    if @usuario_atual != false
      @usuario_atual = login_pela_sessao
    end
    @usuario_atual
  end

  def usuario_atual=( usuario )
    @usuario_atual = usuario
    session[:usuario_id] = usuario.id
    usuario.create_pedido_atual unless usuario.pedido_atual
    unless self.pedido_atual.blank?
      usuario.pedido_atual.unir( self.pedido_atual )
      self.pedido_atual.destroy
    end
    session[:pedido_id] = usuario.pedido_atual.id
  end

  def login_pela_sessao
    resultado = !session[:usuario_id].blank? && Usuario.find_by_id( session[:usuario_id] )
    resultado ? resultado : false
  end

end