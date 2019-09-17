puts "	  Boas Vindas - Sistema de Vagas"
print "	  #1. Inserir uma vaga \n
	  #2. Ver vagas \n
    #3. Buscar vagas \n
	  #4. Sair\n
	  ================================ \n
	  Digite uma opção: "
opcao = gets
puts "================================ "
opcao = opcao.to_i
vagas = []

while opcao != 4 do
  if opcao == 1
    print "Título: "
    titulo = gets.chomp.downcase
    print "\nDescrição: "
    descricao = gets.chomp.downcase
    vagas << {titulo: titulo, descricao: descricao}
  elsif opcao == 2
    vagas.each_with_index do |vaga, index|
      puts "Vaga ##{index}"
      puts "#{vaga[:titulo]} - #{vaga[:descricao]}"
      puts "=============="
    end
  elsif opcao == 3
    print "Busca: "
    busca = gets.chomp.downcase
    puts " -- "

    resultado = vagas.select {|vaga| vaga[:titulo].include? busca or vaga[:descricao].include? busca }

    puts "#{resultado.length} vagas encontradas"

    resultado.each_with_index do |vaga, index|
      puts "Vaga ##{index}"
      puts "#{vaga[:titulo]} - #{vaga[:descricao]}"
      puts "--"
    end

  else
    puts "Opção Inválida"
  end

  print "Digite uma opção: "
  opcao = gets.chomp
  puts "================================ "
  opcao = opcao.to_i
end

#code saga by campus code