class Dealer < Gamer
  def initialize(name = "Dealer", money = 100)
    @@count = @@count ||=0
    @@count +=1
    @name = "#{name} #{@@count} "
    super
    @type_gamer = :robot
  end
end
