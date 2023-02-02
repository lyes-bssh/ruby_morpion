class Board
  attr_accessor :boardcases
  def initialize
    # Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    # Ces instances sont rangées dans une array qui est l'attr_accessor 
    @boardcase = []
    for i in (1..9)   #crée une array de 9 cases
      @boardcase << BoardCase.new(i.to_s)
    end
    print_board
  end

  def print_board  
    barre = '|'
    x = ' ' * 3
    y = ' ' * 14 + barre + ' ' * 7 + barre
    z = ' ' * 6 + '_' * 26

    puts " \n\n "
    puts y
    puts ' ' * 10 + @boardcase[0].value + x + barre + x + @boardcase[1].value + x + barre + x + @boardcase[2].value
    puts y
    puts z
    puts
    puts y
    puts ' ' * 10 + @boardcase[3].value + x + barre + x + @boardcase[4].value + x + barre + x + @boardcase[5].value
    puts y
    puts z
    puts
    puts y
    puts ' ' * 10 + @boardcase[6].value + x + barre + x + @boardcase[7].value + x + barre + x + @boardcase[8].value
    puts y
    puts
    puts
  end
  
  def play(choice, result)
    @boardcase[choice - 1].value = result
  end

  def already_played?(choice)
    if @boardcase[choice - 1].value == 'X' || @boardcase[choice - 1].value == 'O'
      true
    else
      false
    end
  end

  def victory?
    win_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    victory = 0
    win_combos.each do |combo|
      if @boardcase[combo[0]].value == 'X' && @boardcase[combo[1]].value == 'X' && @boardcase[combo[2]].value == 'X'
        victory = 1
      elsif @boardcase[combo[0]].value == 'O' && @boardcase[combo[1]].value == 'O' && @boardcase[combo[2]].value == 'O'
        victory = 2
      end
    end
    victory
  end
end
