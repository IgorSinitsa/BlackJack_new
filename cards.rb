# подготовка карт к выдачи
class Cards
  attr_reader :card

  def initialize
    card_type = ["♠", "♥", "♣", "♣"]
    card = [2, 3, 4, 5, 6, 7, 8, 9, 10, "В", "Д", "К", "Т"]
    card_number = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 1]
    @cards = []
    @card_index = -1
    card_type.each do |value|
      card.each_index do |index|
        @cards << ["#{card[index]}#{value}", card_number[index]]
      end
    end
    shafle
  end

  def send_card
    @card_index += 1
    shafle if @card_index == @cards.count - 1
    load_card
    @card
  end

  def shafle
    @cards = @cards.sort_by { rand }
    @card_index = 0
    load_card
  end

  def load_card
    @card = @cards[@card_index]
  end

  # private

  def send_cards
    @cards
  end
end
