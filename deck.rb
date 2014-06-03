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
