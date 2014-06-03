class Hand
  attr_reader :hand

  def initialize
    @hand = []
  end

  def last_dealt_card
    hand[-1].card
  end

  def hit!(dealt_card)
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
