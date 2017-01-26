def da_boas_vindas
  puts "Bem vindo ao jogo da adivinhação"
  puts "Qual seu nome?"
  nome = gets.strip

  puts "\n\n\n\n"

  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def pede_dificuldade
  puts "Qual o nível de dificuldade que deseja? (1 - Fácil, 5 - difícil)"
  dificuldade = gets.to_i
end

def sorteia_numero(dificuldade)
  case dificuldade
    when 1
      maximo = 30
    when 2
      maximo = 60
    when 3
      maximo = 100
    when 4
      maximo = 150
    else
      maximo = 200
  end

  puts "Escolhendo um número entre 1 e #{maximo}..."
  numero_sorteado = rand(maximo) + 1
  puts "Escolhido... que tal adivinhar hoje o nosso número secreto? \n\n\n\n"
  numero_sorteado
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
  puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
  puts "Chutes até agora: #{chutes}"
  puts "Entre com o número"
  chute = gets.strip

  chutes << chute

  puts "\nSerá que você acertou? Vocề chutou #{chute}"
  chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
  acertou = chute == numero_secreto

  if acertou
    puts "Acertou!"
    return true
  end

  puts "Errou!"

  if (numero_secreto > chute)
    puts "O número secreto é maior!"
  else
    puts "O número secreto é menor!"
  end
  false
end

def joga(nome, dificuldade)
  numero_secreto = sorteia_numero dificuldade
  limite_de_tentativas = 5
  chutes = [];
  pontos_ate_agora = 1000

  for tentativa in 1..limite_de_tentativas
    chute = pede_um_numero chutes, tentativa, limite_de_tentativas

    if nome == "Rodrigo"
      puts "Acertou!"
      break
    end

    pontos_a_perder = (chute - numero_secreto).abs / 2.0
    pontos_ate_agora = pontos_ate_agora - pontos_a_perder

    break if verifica_se_acertou numero_secreto, chute
  end

  puts "Você ganhou #{pontos_ate_agora} pontos nesta rodada!"
end

def nao_quer_jogar
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  quero_jogar.upcase == "N"
end


loop do
  nome = da_boas_vindas
  dificuldade = pede_dificuldade
  joga nome, dificuldade

  break if nao_quer_jogar

end
