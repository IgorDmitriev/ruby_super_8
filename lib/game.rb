require_relative 'card'
require_relative 'deck'
require_relative 'hand'
require_relative 'player'
require_relative 'stock'
class Game
  attr_reader :deck, :players

  def initialize(players)
    @players = players
  end

  def request_card_from_deck(player)
    player.take_card(@deck)
  end

  def play_super_eight
    @deck = Deck.new
    @stock = Stock.new
    until game_over?
      play_round
    end
  end

  private

  def play_round
    display_current_status
    @deck.shuffle!
    deal_five_cards_to_each_player
    set_initial_card_for_stock

    loop do
      puts ""
      puts "#{current_player.name} moves...."
      puts ""
      current_player.play_turn(deck, @stock)
      break if current_player.empty?
      next_player!
    end

    calculate_points
    take_cards_from_players_to_deck
    take_cards_from_stock_to_deck
  end

  def display_current_status
    players.each do |player|
      puts "#{player.name} => #{player.score}"
    end
  end

  def calculate_points
    players.each(&:calculate_points)
  end

  def take_cards_from_players_to_deck
    players.each { |player| player.return_cards(deck) }
  end

  def take_cards_from_stock_to_deck
    @stock.return_cards(deck)
  end

  def deal_five_cards_to_each_player
    5.times do
      players.each { |player| player.take_card(@deck) }
    end
  end

  def set_initial_card_for_stock
    # debugger
    card = @deck.take
    @stock.set_initial(card)
  rescue => e
    puts e.message
    @deck.return(card)
    retry
  end

  def game_over?
    players.any?(&:won?)
  end

  def next_player!
    players.rotate!
  end

  def current_player
    players.first
  end

end
