class Dealer < Gamer
  class << self
    attr_accessor :number

    def number
      @count ||= 0
      @count += 1
    end
  end

  def initialize(name = "Dealer", money = 100)
    super
    # puts self.class.number
    @name = "#{name} #{self.class.number} "
    @type_gamer = :robot
  end
end
