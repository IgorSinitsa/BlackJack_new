class Dealer < Gamer
  def initialize(name, money)
    super
    @many = 100
    @type_gamer = :robot
  end
end
