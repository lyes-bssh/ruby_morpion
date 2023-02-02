class Game
  attr_accessor :players, :board

  def initialize
    puts "Are you ready ??? Let's go !!!!!"
    puts "What is the name of the first player ?"
    player1_name = gets.chomp.to_s
    player1 = Player.new(player1_name, "X")
    puts "_" * 37
    puts "What is the name of the second player ?"
    player2_name = gets.chomp.to_s
    player2 = Player.new(player2_name, "O")

    @players = [player1, player2] #créer un array des joueurs
    @board = Board.new
  end

  def launch_game
    # Lance la partie
    #il y a 9 tours maximum, sinon il y a une égalité
    9.times do |i|
      # --> @board.victory pour déterminer avant chaque tour si une condition de victoire est remplie? 

      if @board.victory? == 0
        turn(i)
      else
        if @board.victory? == 1 
          puts "#{@players[0].firstname} is the wiiiiinneeeeeer !!!"

        else #si le joueur ayant les 'O' gagne (voir méthode victory? dans game.rb)
          puts "#{@players[1].firstname} is the wiiiiinneeeeeer !!!"
        end
        exit
      end
    end
  end

  def turn(i)
    n = i % 2 #A chaque itération, i est incrémenté de 1
    puts "#{@players[n].firstname}, choose a number between 1 and 9"
    choice = gets.chomp.to_i
    while !choice.between?(1, 9) || (@board.already_played?(choice) == true)
      if !choice.between?(1, 9)
        puts "You did not choose a number between 1 and 9 ! #{@players[n].firstname}, choose a number between 1 and 9"
        choice = gets.chomp.to_i
      elsif @board.already_played?(choice) == true 
        puts "This number is already taken!"
        puts "#{@players[n].firstname}, choose a number between 1 and 9"
        choice = gets.chomp.to_i
      end
    end
    @board.play(choice, @players[n].type)
    @board.print_board
  end
end
