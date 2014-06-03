require_relative 'classes'
require 'pry'

puts 'Welcome to Blackjack!'

game_deck = Deck.new

player = Hand.new
player.hit(game_deck.deal!)
puts "Player was dealt #{player.hand[-1].card}"


# deal to player
# player score

# H/S?

# while input is hit
#   deal to player
#   if player.best_value > 21
#     puts 'You lose!'
#     exit
#   end
#   H/S?
# end

# deal to dealer
# deal to dealer

# while dealer.best_value < 17
#   deal to dealer
#   if dealer.best_value > 21
#     puts 'Bust! You win!'
#     exit
#   end
# end

# compare scores, whoever is closer to 21 wins!
