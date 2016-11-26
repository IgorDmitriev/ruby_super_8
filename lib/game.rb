class Game
  attr_reader :deck

  def initialize(*players)
    set_players
  end

  def play_super_eight
    @deck = Deck.new
    until game_over?
      play_round
    end
  end

  def play_round
    shuffle_deck
    push_five_cards_to_each_player_from(deck)
    set_initial_card_for_stock

    loop do
      next_player.play_round(stock)
      break if next_player.dont_have_any_cards?
      next_player!
    end

    calculate_points
    take_cards_from_players_to_deck
    take_cards_from_stock_to_deck
  end

  def request_card_from_deck(player)
    player.push_card_from(deck)
  end

  private

  def game_over?
    players.any?(&:won?)
  end

  def next_player!
    players.rotate!
  end

  def next_player
    players.first
  end

end
