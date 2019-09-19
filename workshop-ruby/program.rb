require_relative 'vaga.rb'

SAIR = 5

def to_boolean(str)
  str == 'true'
end

def carregar_vagas
  if File.exist?("vagas.txt")
    File.open("vagas.txt").each do |line|
      vaga = line.split ';'
      cadastra_vaga vaga[0], vaga[1], to_boolean(vaga[2])
    end
  end
  Vaga.all
end

def cadastra_vaga(titulo, descricao, ativo=nil)
  vaga = Vaga.new titulo, descricao
  vaga.activate if ativo
  vaga
end

def tela_cadastro
  print "Título: "
  titulo = gets.chomp
  print "\nDescrição: "
  descricao = gets.chomp
  vaga = cadastra_vaga titulo, descricao
  File.open("vagas.txt", "a") { |file| file.puts "#{vaga.titulo};#{vaga.descricao};#{vaga.active?}"}
  system "clear"
end

def buscar
  print "Busca: "
  termo = gets.chomp
  puts " -- "

  resultado = Vaga.all.select {|vaga| vaga.include?(termo) }

  puts "#{resultado.length} vagas encontradas"

  resultado.each_with_index do |vaga, index|
    puts "Vaga ##{index}"
    puts "#{vaga.titulo} - #{vaga.descricao}"
    puts "--"
  end
end

def imprime_menu
  puts "Boas Vindas - Sistema de Vagas"
  puts "    #1. Inserir uma vaga"
  puts "    #2. Ver vagas"
  puts "    #3. Buscar vagas"
  puts "    #4. Ativar vagas"
  puts "    ##{SAIR}. Sair"
  puts "================================"
  print "Digite uma opção: "
end

def imprime_vagas
  Vaga.all.each_with_index do |vaga, index|
    puts "##{index+1} - Título: #{vaga.titulo} Descrição: #{vaga.descricao} Ativa: #{vaga.active?}"
  end
end

def ativa_vaga
  imprime_vagas
  opcao_vaga = gets.chomp.to_i - 1
  vagas = Vaga.all
  if opcao_vaga > vagas.length-1
    puts "Opção inválida!"
    gets
    return
  end
  vaga = vagas[opcao_vaga]
  vaga.activate
  atualiza_registro
  puts "Vaga ##{opcao_vaga}-#{vaga.titulo} ativa!"
  gets
end

def atualiza_registro
  File.open("vagas.txt", "w") do |file|
    Vaga.all.each { |vaga| file.puts "#{vaga.titulo};#{vaga.descricao};#{vaga.active?}" }
  end
end

#inicio
carregar_vagas
imprime_menu
opcao = gets.to_i
system "clear"


while opcao != SAIR do
  if opcao == 1
    tela_cadastro
  elsif opcao == 2
    imprime_vagas
    print "Aperte ENTER para continuar..."
    gets
  elsif opcao == 3
    buscar
  elsif opcao == 4
    ativa_vaga
  else
    puts "[ERROR] Opção Inválida"
    system "clear"
  end
  imprime_menu
  opcao = gets.chomp.to_i
  system "clear"
end

#code saga by campus code