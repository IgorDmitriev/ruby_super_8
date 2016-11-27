class Player
  attr_reader :name, :score

  def initialize(name)
    @name = name
    @hand = Hand.new
    @score = 0
  end

  def play_turn(deck, stock)
    display_current_status(stock)
    case get_action
    when :take_card
      card = take_card(deck)
      raise "You got: #{card.to_s}"
    when :play_card
      if can_play_card?(stock)
        play_card(stock)
      else
        raise "You don't have any valid cards for next move. Please take card from deck."
      end
    end
  rescue => e
    puts e.message
    return if e.message == 'not enough cards'
    retry
  end

  def can_play_card?(stock)
    @hand.cards.any? { |card| stock.valid_move?(card) }
  end

  def play_card(stock)
    card = get_card_input
    if card.value == :eight
      suit = get_next_suit
      stock.set_suit(suit)
    end
    stock.put_card(card)
  rescue => e
    puts e.message
    @hand.add(card)
    display_current_status
    retry
  end

  def get_card

  end

  def get_action
    puts "Choose your action: [p]lay card; [t]ake card from deck"
    case gets.chomp.downcase[0]
    when 'p' then :play_card
    when 't' then :take_card
    else raise "\nInvalid action\n"
    end
  rescue => e
    print e.message
    retry
  end

  def take_card(deck)
    card = deck.take
    @hand.add(card)
  end

  def calculate_points
    @score += @hand.points
  end

  def return_cards(deck)
    cards = @hand.cards
    deck.return(cards)
    @hand.clear
  end

  def won?
    @score > 99
  end

  def empty?
    @hand.count == 0
  end

  private

  def get_next_suit
    puts "Choose suit: [s]pades [c]lubs [h]earts [d]iamonds"
    print "> "
    gets.chomp[0]
  end

  def get_card_input
    card_idx = get_input
    @hand.get_card(card_idx)
  rescue => e
    puts e.message
    puts " "
    retry
  end

  def display_current_status(stock)
    stock.display
    @hand.display
  end

  def get_input
    puts "Choose your card by idx:"
    print "> "
    parse(gets.chomp)
  rescue
    puts "Please use card index."
    retry
  end

  def parse(string)
    Integer(string)
  end
end
