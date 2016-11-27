class Stock
  def initialize
    @cards = []
    @new_suit = nil
  end

  def last_card
    @cards.last
  end

  def suit
    @new_suit || last_card.suit
  end

  def set_suit(suit)
    case suit
    when 's' then @new_suit = :spades
    when 'c' then @new_suit = :clubs
    when 'h' then @new_suit = :hearts
    when 'd' then @new_suit = :diamonds
    else
      raise 'Invalid suit'
    end
  end

  def display
    puts "Last card in stock: #{last_card}"
    puts "New suit is: #{@new_suit.to_s}" if @new_suit
  end

  def put_card(card)
    raise 'Invalid move' unless valid_move?(card)
    @cards << card
    @new_suit = nil unless card.value == :eight
  end

  def set_initial(card)
    raise '8 can not be initial card' if card.value == :eight
    @cards << card
  end

  def valid_move?(card)
    return true if card.value == :eight
    suit == card.suit || last_card.value == card.value
  end
end
