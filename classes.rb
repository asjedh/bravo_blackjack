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


class Card

  attr_reader :number, :suit

  def initialize(number, suit)
    @number = number
    @suit = suit
  end

  def card
    number + suit
  end

  def value
    POSSIBLE_VALUES[number]
  end

end

class Deck
  attr_reader :cards_in_deck

  def initialize
    @cards_in_deck = create_deck
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

  def deal!
    cards_in_deck.delete_at(0)
  end

end


class Hand
  attr_reader :hand

  def initialize
    @hand = []
  end

  def hit(dealt_card)
    hand << dealt_card
  end

  def value_wo_aces
    hand.inject(0) { |value_wo_aces, card| card.number != 'A' ? value_wo_aces + card.value : value_wo_aces }
  end

  def number_of_aces
    hand.inject(0) { |number_of_aces, card| card.number == 'A' ? number_of_aces + 1 : number_of_aces }
  end

  def best_value_of_aces
    if number_of_aces == 0
      # no Aces, no value
      0
    elsif 11 - number_of_aces >= value_wo_aces
      #one Ace is 11, the rest are 1
      ace_value_with_one_ace_as_11 = 10 + number_of_aces
    else
      #all Aces are 1 in this case
      number_of_aces
    end
  end

  def best_total_value
    value_wo_aces + best_value_of_aces
  end

end




