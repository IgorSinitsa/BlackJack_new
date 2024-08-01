# frozen_string_literal: true
# тут будем собирать программу
require './cards.rb'
require './gamer.rb'
m = Gamer.new("ddddd", 100)
cards = Cards.new
m.take_deck(cards)
# Cards.initialize
# puts m.send_cards
m.take_card
puts m.show_card
m.take_card
puts m.show_card
m.take_card
puts m.show_card
m.take_card
puts m.show_card
m.take_card
puts "#{m.cards} - #{m.scope} "
