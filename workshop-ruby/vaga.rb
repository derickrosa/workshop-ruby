class Vaga
  #attr_reader :titulo, :descricao
  #attr_writer :titulo, :descricao
  attr_accessor :titulo, :descricao, :candidatos

  def initialize(titulo, descricao)
    @titulo = titulo
    @descricao = descricao
    @ativo = false
    @candidatos = []
  end

  def activate
    self.ativo = true
  end

  def active?
    ativo
  end

  def include?(texto)
    titulo.downcase.include?(texto) || descricao.downcase.include?(texto)
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.count
    all.count
  end

  private
  attr_accessor :ativo
end
