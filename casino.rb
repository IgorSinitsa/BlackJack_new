class Casino
  attr_reader :total_money, :name, :gamers

  def initialize(name)
    @name = name
    @gamers = []
    @total_money = 0
    @control_game = nil
  end

  def get_gamer(gamer)
    @gamers << gamer unless @gamers.include?(gamer)
  end

  def take_many
    @gamers.each { |gamer| @bid += gamer.pay_many }
  end

  def start_game
    @gamers.each do |gamer|
      raise BlackJackError, "Нет монет на ставку у игрока #{gamer.name}" unless gamer.bid
      @total_money += gamer.pay_money
    end
    loop do
      break unless @control_game.play(self)
    end
    # (1..3).each do |index|
    #   step_game
    #   show_cards
    # rescue BlackJackError => e
    #   puts e
    #   # stop_game
    # end
  end

  def show_cards
    @gamers.each do |gamer|
      puts "Игрок #{gamer.name} - очки #{gamer.scope}"
      puts "#{gamer.cards}"
      raise BlackJackError, "У игрока #{gamer.name}  21 очко" if (gamer.scope + gamer.bonus) == 21
    end
  end

  def step_game
    @gamers.each { |gamer| gamer.take_card }
  end

  def get_game(game)
    @control_game = game
  end
end
