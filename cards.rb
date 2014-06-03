require 'pry'
require_relative = 'deck'
require_relative = 'hand'
require_relative = 'game'


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
                    'K' => 10
                              }

class Card
  attr_reader :number

  def initialize(number, suit)
    @number = number
    @suit = suit
  end


  def card
    number + suit
  end

  def value
    return '1 or 11' if number == 'A'
    POSSIBLE_VALUES[number]
  end

end


ace_of_hearts = Card.new('10', '♥')
puts ace_of_hearts.value



