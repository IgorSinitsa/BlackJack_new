class BlackJack
  attr_reader :number_rounds, :round, :win_gamers

  def initialize
    @name = "Black Jack"
    @number_rounds = 3
    @round = 0
    @stop_game = false
    @robot = nil
    @gamer = nil
  end

  def Start(casino)
    @win_gamers = []
    @stop_game = false
    casino.gamers.each do |gamer|
      # @stop_game = true unless gamer.bid
      @human = gamer if gamer.type_gamer == :human
      @robot = gamer if gamer.type_gamer == :robot
    end
    puts "*************************************************"
    info(casino)
    play
    show_card_robot
    show_card(@human)
    menu_gamer
    @robot.take_card if ((@robot.scope + @robot.bonus) <= 17) || !@stop_game
    puts "-------------------------------------------"
    show_card(@robot)
    show_card(@human)
    robot = scope(@robot) <= 21 ? scope(@robot) : 0
    human = scope(@human) <= 21 ? scope(@human) : 0
    if robot == human && !human.zero?
      @win_gamers << @robot
      @win_gamers << @human
    elsif robot > human
      @win_gamers << @robot
    elsif !human.zero?
      @win_gamers << @human
    end
    false
  end

  protected

  def play
    (1..2).each { |_take| take_card }
  end

  def info(casino)
    puts "Игра #{@name} в заведении #{casino.name} на кону #{casino.total_money} монет "
  end

  def take_card
    @human.take_card
    @robot.take_card
  end

  def show_card_robot
    puts "Игрок #{@robot.name} "
    puts "[  *  ,  *  ]"
  end

  def show_card(gamer)
    scope = gamer.scope + gamer.bonus > 21 ? gamer.scope : gamer.scope + gamer.bonus
    puts "Игрок #{gamer.name} - очки #{scope}"
    puts "#{gamer.cards}"
  end

  def menu_gamer
    puts "Выберите действие"
    puts "0 - открыть карты"
    puts "1 - пропустить"
    puts "2 - взять карту"
    number = gets.chomp.to_i
    @stop_game = true if number.zero?
    @human.take_card if number == 2
  end

  def scope(gamer)
    gamer.scope + gamer.bonus > 21 ? gamer.scope : gamer.scope + gamer.bonus
  end
end
