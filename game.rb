require_relative 'hand'
require_relative 'deck'
require_relative 'cards'


POSSIBLE_VALUES = { '2' => 2,
                    '3' => 3,
                    '4' => 4,
                    '5' => 5,
                    '6' => 6,
                    '7' => 7,
                    '8' => 8,
                    '9' => 9,
                    '10' => 10,
                    'J' => 10,
                    'Q' => 10,
                    'K' => 10,
                    'A' => '1 or 11'
                              }

SUITS = ['♦','♣', '♠', '♥']

def player_score
  "Player was dealt #{player.last_dealt_card}"
end


puts 'Welcome to Blackjack!'

game_deck = Deck.new

player = Hand.new
dealer = Hand.new


player.hit!(game_deck.deal!)
puts "Player was dealt #{player.last_dealt_card}"
player.hit!(game_deck.deal!)
puts "Player was dealt #{player.last_dealt_card}"
puts "Player score: #{player.best_total_value}"
puts

print "Hit or Stand? (h/s): "
hit_or_stand = gets.chomp
raise "Please input 'h' or 's'" if hit_or_stand != 'h' && hit_or_stand != 's'

while hit_or_stand == 'h'
  player.hit!(game_deck.deal!)
  puts "Player was dealt #{player.last_dealt_card}"
  puts "Player score: #{player.best_total_value}"

  if player.best_total_value > 21
    puts
    puts "Your score is over 21! You lose!"
    exit
  end

  puts
  print "Hit or Stand? (h/s): "
  hit_or_stand = gets.chomp
  raise "Please input 'h' or 's'" if hit_or_stand != 'h' && hit_or_stand != 's'

end
  puts
  puts "Player score: #{player.best_total_value}"
  puts


dealer.hit!(game_deck.deal!)
puts "Dealer was dealt #{dealer.last_dealt_card}"
dealer.hit!(game_deck.deal!)
puts "Dealer was dealt #{dealer.last_dealt_card}"
puts "Dealer score: #{dealer.best_total_value}"
puts


while dealer.best_total_value < 17 && dealer.best_total_value < player.best_total_value
  dealer.hit!(game_deck.deal!)
  puts "Dealer was dealt #{dealer.last_dealt_card}"
  puts "Dealer score: #{dealer.best_total_value}"
  puts

  if dealer.best_total_value > 21
    puts "Dealer busts. You win!"
    exit
  end

end

puts "Dealer stands."
puts

if player.best_total_value > dealer.best_total_value
  puts "Your score is closer to 21. You win!"
elsif dealer.best_total_value > player.best_total_value
  puts "The dealer's score is closer to 21. You lose"
else
  puts "It's a tie. No one wins!"
end
