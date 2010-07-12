class Pedido < ActiveRecord::Base
  
  has_many :itens
  has_many :produtos, :through => :itens
  
  def adicionar_produto(produto, quantidade)
    if item = self.itens.detect { |elemento| elemento.produto == produto }
      item.incrementar_quantidade(quantidade)
      item.save
    else
      self.itens.build( :produto => produto, :quantidade => quantidade )
    end
  end
  
  def preco_total
    total = 0
    self.itens.each{ |item| total += item.preco_total}
    total
  end
  
end