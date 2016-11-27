class Hand
  def initialize
    @cards = []
  end

  def points
    @cards.map(&:super8_value).inject(:+)
  end

  def hit(deck)
    @cards << deck.take
  end

  def get(card)
    @cards << card
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

end
