class Pedido < ActiveRecord::Base
  
  has_many :itens
  has_many :produtos, :through => :itens
  
  def adicionar_produto(produto, quantidade)
    if item = self.itens.detect { |i| i.produto == produto }
      item.update_attributes( :quantidade => item.quantidade + quantidade.to_i )
    else
      self.itens.build( :produto_id => produto.id, :quantidade => quantidade )
    end
  end
  
  def preco_total
    self.itens.inject(0) { |acc, item| acc + item.preco_total }
  end
  
end