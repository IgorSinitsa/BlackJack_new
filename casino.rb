class Casino
  attr_reader :total_money, :name, :gamers

  def initialize(name)
    @name = name
    @gamers = []
    @total_money = 0
    @control_game = nil
    @win_gamer = []
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
   puts  @control_game.win_gamers
  end



  def get_game(game)
    @control_game = game
  end

  def win_gamer(gamer)
    @win_gamer << gamer
  end
end
