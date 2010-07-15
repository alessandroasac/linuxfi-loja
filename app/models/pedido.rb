class Pedido < ActiveRecord::Base
  
  has_many :itens, :dependent => :destroy
  accepts_nested_attributes_for :itens
  after_save :remover_itens_zerados
  #  has_many :produtos, :through => :itens
  
  def adicionar_produto(produto, quantidade)
    if item = self.itens.detect { |i| i.produto == produto }
      item.update_attributes( :quantidade => item.quantidade + quantidade.to_i )
    else
      self.itens.build( :produto_id => produto.id, :quantidade => quantidade )
    end
  end
  
  def preco_total
    self.itens.to_a.sum( &:preco_total )
  end

  def blank?
    self.itens.blank?
  end

  private

  def remover_itens_zerados
    itens_a_remover = []
    self.itens.each do |item|
      puts "#{item.produto.nome}, #{item.quantidade} <<<<<<<<<<<<<<<<<<<<<<<<<<"
      if item.quantidade.blank? || item.quantidade < 1
        itens_a_remover << item
      end
    end
    self.itens.delete( *itens_a_remover )
  end

end