class ControlGame
  attr_reader :number_rounds, :round

  def initialize
    @number_rounds = 3
    @round = 0
  end

  def play(casino)
    in_round(casino.gamers)
  end

  protected
  def stop_game

  end
  def play_type(gamers)
    gamers.each do |gamer|
      method(gamer.type_gamer).call(gamer)
    end
  end

  def human(gamer)
    gamer.take_card
    puts "Игрок #{gamer.name} - очки #{gamer.scope}"
      puts "#{gamer.cards}"
  end

  def robot(gamer)
    gamer.take_card
    puts "Игрок #{gamer.name} - очки #{gamer.scope}"
      puts "#{gamer.cards}"
  end

  def in_round(gamers)
    @round += 1
    if @round > @number_rounds
      @round = 0
      stop_game(gamers)
      false
    else
      play_type(gamers)
      true
    end
  end
end
