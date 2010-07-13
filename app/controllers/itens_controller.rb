class ItensController < ApplicationController

  def index
    @titulo = 'Carrinho'
  end

  def create

    @produto = Produto.find( params[:produto_id] )

    pedido_atual.adicionar_produto(@produto, params[:quantidade])

    pedido_atual.save

    session[:pedido_id] = pedido_atual.id

    respond_to do |format|
      format.html do
        flash[:notice] = "Produto '#{@produto.nome}' adicionado com sucesso ao carrinho"
        redirect_to produtos_path
      end
    end
    
  end

end