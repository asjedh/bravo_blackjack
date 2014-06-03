require 'pry'
require_relative = "cards"
require_relative = "deck"
require_relative = "game"

# POSSIBLE_VALUES = { '2' => 2,
#                     '3' => 3,
#                     '4' => 4,
#                     '5' => 5,
#                     '6' => 6,
#                     '7' => 7,
#                     '8' => 8,
#                     '9' => 9,
#                     '10' => 10,
#                     'J' => 10,
#                     'Q' => 10,
#                     'K' => 10,
#                     'A' => '1 or 11'
#                               }

# SUITS = ['♦','♣', '♠', '♥']

class Deck
  attr_accessor :deck

  def initialize
    @deck = create_deck
  end

  def show_cards
    @deck
  end

  def create_deck
    deck = []
    SUITS.each do |suit|
      POSSIBLE_VALUES.each do |face_value, actual_value|
        deck << Card.new(face_value, suit)
      end
    end
    deck.shuffle
  end

end

deck = Deck.new
puts deck.deck
