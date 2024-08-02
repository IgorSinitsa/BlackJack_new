# frozen_string_literal: true
# тут будем собирать программу
require './error.rb'
require './cards.rb'
require './gamer.rb'
require './casino.rb'
require './control_game.rb'
casino = Casino.new("777")
black_jack = ControlGame.new
casino.get_game(black_jack)
m = Gamer.new("Тереза", 100)
k = Gamer.new("Иван", 100)
l = Gamer.new("Джон", 100)
casino.get_gamer(m)
casino.get_gamer(k)
casino.get_gamer(l)
cards = Cards.new
m.take_deck(cards)
k.take_deck(cards)
l.take_deck(cards)
# Cards.initialize
# puts m.send_cards
casino.start_game
