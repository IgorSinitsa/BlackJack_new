class ControlGame
  attr_reader :number_rounds, :round

  def initialize
    @number_rounds = 3
    @round = 0
    @stop_game
  end

  def play(casino)
    in_round(casino.gamers)
  end

  protected

  def stop_game(gamers)
  end

  def play_type(gamers)
    gamers.each do |gamer|
      method(gamer.type_gamer).call(gamer)
    end
  end

  def human(gamer)
    gamer.take_card if @round == 1
    show_card(gamer)
  end

  def robot(gamer)
    gamer.take_card if @round <= 2
    gamer.take_card if @round == 3 && (gamer.scope + gamer.bonus) <= 17
    show_card_robot(gamer)
    show_card(gamer)
  end
  def show_card_robot(gamer)
    puts "Игрок #{gamer.name} "
    print "["
    gamer.cards. each { |card |print " * "}
    print "] \n"
  end

  def show_card(gamer)
    puts "Игрок #{gamer.name} - очки #{gamer.scope + gamer.bonus}"
    puts "#{gamer.cards}"
  end

  def in_round(gamers)
    @round += 1
    if @round > @number_rounds
      @round = 0
      stop_game(gamers)
      false
    else
      puts "Раунд #{@round}"
      play_type(gamers)
      true
    end
  end
end
