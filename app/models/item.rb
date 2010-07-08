class Item < ActioveRecord::Base
  
  belongs_to :produto
  belongs_to :pedido
  
  validates_presence_of :produto_id, :pedido_id, :quantidade
  
  def incrementar_quantidade(quantidade)
    self.quantidade += quantidade
  end
  
  def preco_total
    self.preco * self.quantidade
  end
end