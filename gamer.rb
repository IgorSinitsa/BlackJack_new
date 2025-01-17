class Gamer
  attr_reader :cards, :money, :pay_money, :scope, :name, :bonus, :type_gamer

  TOTAL_BID = 10

  def initialize(name, money = 100)
    @name = name
    @money = money
    @deck = nil
    @type_gamer = :human
    init
  end

  def take_card(number = 1)
    (1..number).each do
    card = @deck.send_card
    @cards << card[0]
    @scope += card[1]
    @bonus = 10 if card[1] == 1
    end
  end

  def show_card
    @cards
  end

  def take_deck(deck)
    @deck = deck
  end

  def bid
    if @money >= TOTAL_BID
      @money -= TOTAL_BID
      @pay_money = TOTAL_BID
      true
    else
      @pay_money = 0
      false
    end
  end

  def win(money)
    puts @money
    @money += money
    puts @money
  end

  def play; end

  def init
    @cards = []
    @scope = 0
    @bonus = 0
    @pay_money = 0
  end
end
