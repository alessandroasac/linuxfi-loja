class ProdutosController < ApplicationController

  def show
    @produto = Produto.find( params[:id] )
  end

  def index
    @titulo = 'Listagem de Produtos'
    @produtos = if params[:q].blank?
      Produto.all
    else
      #      Produto.all( :conditions =>
      #          [ "nome LIKE ? OR descricao LIKE ?",
      #          "%#{params[:q]}%",
      #          "%#{params[:q]}%" ],
      #      :order => "preco DESC"
      #    )
      resultado = Produto.solr_search do |s|
        s.keywords params[:q]
      end
      resultado.results
    end
    respond_to do |format|
      format.html
      format.xml do
        render :xml => @produtos
      end
    end
  end
end