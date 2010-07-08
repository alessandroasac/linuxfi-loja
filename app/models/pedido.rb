class Pedido < ActiveRecord::Base
  has_many :itens
  has_many :produtos, :through => :itens
  
  def adicionar_produto(pruduto, quantidade)
    if item = self.itens.detect { |elemento| elemento.produto == produto }
      item.incrementar_quantidade(quantidade)
      item.save
    else
      self.itens.build( :produto => produto, :quantidade => quantidade )
    end
  end
  
end