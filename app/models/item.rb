class Item < ActiveRecord::Base
  
  belongs_to :produto
  belongs_to :pedido
  
#  validates_presence_of :produto_id, :pedido_id, :quantidade
  
  def incrementar_quantidade(quantidade)
    self.quantidade += quantidade
  end
  
  def preco_total
    self.produto.preco * self.quantidade
  end
end