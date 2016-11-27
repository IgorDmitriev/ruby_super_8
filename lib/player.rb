class Player
  attr_reader :name, :score

  def initialize(name)
    @name = name
    @hand = Hand.new
    @score = 0
  end

  def play_turn(stock)
    display_current_status(stock)
    card = get_card_input
    stock.put_card(card)
  rescue => e
    puts e.message
    @hand.add(card)
    retry
  end

  def take_card(deck)
    card = deck.take
    @hand.add(card)
  end

  def add_score(num)
    @score += num
  end

  def return_cards(deck)
    cards = @hand.cards
    deck.return_cards(cards)
    @hand.clear
  end

  def won?
    @score > 99
  end

  def empty?
    @hand.count == 0
  end

  private

  def get_card_input
    card_idx = get_input
    @hand.get_card(card_idx)
  rescue => e
    puts e.message
    puts " "
    retry
  end

  def display_current_status(stock)
    puts "Last card in stock: #{stock.last_card}"
    puts "Your cards: #{@hand.to_s}"
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
