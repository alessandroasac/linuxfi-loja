class ItensController < ApplicationController
  
  def create
    pedido_atual.save
    session[:pedido_id] = pedido_atual.id
    
    pedido_atual.adicionar_produto(Produto.find(params[:produto_id]), params[:quantidade])
    
    respond_to do |format|
      format.html do
        flash[:notice] = 'O produto foi adicionado com sucesso ao seu carrinho'
        redirect_to produtos_path
      end
    end
  end
end