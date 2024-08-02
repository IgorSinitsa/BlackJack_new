class ControlGame
  attr_reader :number_rounds, :round, :win_gamers

  def initialize
    @name = "Black Jack"
    @number_rounds = 3
    @round = 0
    @stop_game = false
  end

  def play(casino)
    puts "Игра #{@name} в заведении #{casino.name} на кону #{casino.total_money} монет " if round == 0
    in_round(casino.gamers)
  end

  protected

  def stop_game(gamers)
    win_scope = 0
    @win_gamers, win_gamers = []
    puts "Игра окончена"
    gamers.each do |gamer|
      scope = 0
      scope = gamer.scope if gamer.scope <= 21
      scope = gamer.bonus + gamer.scope if (gamer.bonus + gamer.scope) <= 21
      show_card(gamer)
      win_gamers << gamer if win_scope == scope && win_scope != 0

      if scope > win_scope
        win_gamers = [gamer]
        win_scope = scope
      end
    end
    @win_gamers = win_gamers
  end

  def play_type(gamers)
    gamers.each do |gamer|
      method(gamer.type_gamer).call(gamer)
    end
  end

  def human(gamer)
    show_card(gamer)
    @round == 1 ? gamer.take_card : menu(gamer)
  end

  def menu(gamer)
    puts "Выберите действие"
    puts "0 - открыть карты"
    puts "1 - пропустить"
    puts "2 - взять карту" if gamer.cards.count == round - 1
    number = gets.chomp.to_i
    @stop_game = true if number == 0
    gamer.take_card if number ==2 && gamer.cards.count == round - 1

  end

  def robot(gamer)
    gamer.take_card if @round <= 2
    gamer.take_card if @round == 3 && (gamer.scope + gamer.bonus) <= 17
    show_card_robot(gamer)
  end

  def show_card_robot(gamer)
    puts "Игрок #{gamer.name} "
    print "["
    gamer.cards.each { |card| print " * " }
    print "] \n"
  end

  def show_card(gamer)
    puts "Игрок #{gamer.name} - очки #{gamer.scope + gamer.bonus}"
    puts "#{gamer.cards}"
  end

  def in_round(gamers)
    @round += 1
    if @round > @number_rounds || @stop_game
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
