class Casono
  attr_reader :total_many

  def initialize
    @gamers = []
  end

  def get_gamer(gamer)
    @gamers << gamer unless @gamers.include?(gamer)
  end

  def take_many
    @gamers.each { |gamer| @bid += gamer.pay_many }
  end
  def start_game
    @gamers.play
  end
  def show_cards
    @gamers.each do |gamer|
      puts "Игрок #{gamer.name} - очки#{gamer.scope}"
    end
  end
end
