class Stock
  def initialize
    @cards = []
  end

  def last_card
    @cards.last
  end

  def put_card(card)
    raise 'Invalid move' unless valid_move?(card)
    @cards << card
  end

  def set_initial(card)
    raise '8 can not be initial card' if card.value == :eight
    @cards << card
  end

  private

  def valid_move?(card)
    return true if card.value == :eight
    last_card.suit == card.suit || last_card.value == card.value
  end
end
