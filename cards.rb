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
