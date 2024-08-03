# этот класс заменен другим классом BlackJack
class ControlGame
  attr_reader :number_rounds, :round, :win_gamers

  def initialize
    @name = 'Black Jack'
    @number_rounds = 3
    @round = 0
    @stop_game = false
  end

  def play(casino)
    puts "Игра #{@name} в заведении #{casino.name} на кону #{casino.total_money} монет " if round.zero?
    in_round(casino.gamers)
  end

  protected

  def stop_game(gamers)
    win_scope = 0
    @win_gamers, win_gamers = []
    puts 'Игра окончена'
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

  # def play_type(gamers)
  #   gamers.each do |gamer|
  #     method(gamer.type_gamer).call(gamer)
  #   end
  # end

  # def human(gamer)
  #   show_card(gamer)

  #   @round == 3 ?  menu(gamer) : gamer.take_card
  # end

  def menu(gamer)
    puts 'Выберите действие'
    puts '0 - открыть карты'
    puts '1 - пропустить'
    puts '2 - взять карту'
    number = gets.chomp.to_i
    @stop_game = true if number.zero?
    gamer.take_card if number == 2
  end

  def robot(gamer)
    gamer.take_card if @round <= 2
    gamer.take_card if @round == 3 && (gamer.scope + gamer.bonus) <= 17
    show_card_robot(gamer)
  end

  def show_card_robot(gamer)
    puts "Игрок #{gamer.name} "
    print '['
    gamer.cards.each { |_card| print ' * ' }
    print "] \n"
  end

  def show_card(gamer)
    scope = gamer.scope + gamer.bonus > 21 ? gamer.scope : gamer.scope + gamer.bonus
    puts "Игрок #{gamer.name} - очки #{scope}"
    puts "#{gamer.cards}"
  end

  def in_round(gamers)
    @round = 3
    human = []
    robot = []
    gamers.each do |gamer|
      gamer.take_card
      gamer.take_card
      human << gamer if gamer.type_gamer == :human
      robot << gamer if gamer.type_gamer == :robot

    end
    human.each do |gamer|
    show_card(gamer)
    menu(gamer)
    end

    robot.each {|gamer| robot(gamer)} unless @stop_game
    # gamers.each {|gamer| show_card(gamer) }
    stop_game(gamers)
    false
  end
end
