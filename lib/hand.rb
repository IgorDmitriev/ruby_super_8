class Hand
  attr_reader :cards
  def initialize
    @cards = []
  end

  def count
    @cards.size
  end

  def points
    @cards.map(&:super8_value).inject(:+)
  end

  def add(card)
    @cards << card
    card
  end

  def get_card(idx)
    raise 'Wrong index' if idx < 0 || idx > @cards.size - 1
    @cards.delete_at(idx)
  end

  def clear
    @cards = []
  end

  def display
    puts "Your cards: #{self.to_s}"
  end

  def to_s
    @cards.map.with_index do |card, idx|
      "[#{idx}]: #{card.to_s}"
    end.join(' | ')
  end

end
