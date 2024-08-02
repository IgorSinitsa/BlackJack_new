# frozen_string_literal: true
# тут будем собирать программу
require './error.rb'
require './cards.rb'
require './gamer.rb'
require './dealer.rb'
require './casino.rb'
require './control_game.rb'
casino = Casino.new("777")
black_jack = ControlGame.new
casino.get_game(black_jack)
k = Dealer.new()
# m = Dealer.new()
# l = Dealer.new("Dealer2", 100)
# m = Gamer.new("Тереза", 100)
puts "Введите имя игрока"
name = gets.chop.strip
l = Gamer.new(name, 100)
# casino.get_gamer(m)
casino.get_gamer(k)
casino.get_gamer(l)
cards = Cards.new
# m.take_deck(cards)
k.take_deck(cards)
l.take_deck(cards)
# Cards.initialize
# puts m.send_cards
casino.start
