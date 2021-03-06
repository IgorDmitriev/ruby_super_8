require_relative 'card'

# Represents a deck of playing cards.
class Deck

  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def shuffle!
    @cards.shuffle!
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  # Takes `n` cards from the top of the deck.
  def take(n = 1)
    raise 'not enough cards' if @cards.count < n
    n == 1 ? @cards.shift : @cards.shift(n)
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    case cards
    when Card then @cards << cards
    when Array then @cards += cards
    else
      raise 'Only cards can be returned to the deck.'
    end
  end
end
