class Casino
  attr_reader :total_money, :name, :gamers

  def initialize(name)
    @name = name
    @gamers = []
    @total_money = 0
    @control_game = nil
    @win_gamers = []
  end

  def get_gamer(gamer)
    @gamers << gamer unless @gamers.include?(gamer)
  end

  def take_many
    @gamers.each { |gamer| @bid += gamer.pay_many }
  end

  def start
    loop do
      @gamers.each do |gamer|
        gamer.init
        puts "*************************************************"
        puts "У игрока #{gamer.name} #{gamer.money} монет"
      end
      start_game
      puts 'Если хотите продолжить нажмите  ввод, если нет то любую клавишу'
      print '>'
      symbol = gets.chop.strip
      break unless symbol.empty?
    end
  end

  def start_game
    @gamers.each do |gamer|
      raise BlackJackError, "Нет монет на ставку у игрока #{gamer.name}" unless gamer.bid

      @total_money += gamer.pay_money
    end
    loop do
      break unless @control_game.Start(self)
    end
    win_gamer(@control_game.win_gamers)
  end

  def get_game(game)
    @control_game = game
  end

  def win_gamer(gamers)
    @win_gamers << gamers
    if !gamers.empty?
      count = gamers.count
      money =   count.zero? ?  0 : @total_money / count
      gamers.each do |gamer|

        puts "Выиграл игрок #{gamer.name} , сумма выигрыша #{money}  !!!!"
        gamer.win(money)
      end
      @total_money = 0
    else
      puts 'Выигрывших нет, ставки остаются в банке'
    end
  end
end
