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
    each_player_take_five_cards
    set_initial_card_for_stock

    loop do
      players.first.play_round
      break if players.first.dont_have_any_cards?
      next_player!
    end

    calculate_points
    take_cards_from_players_to_deck
  end

  private
  
  def game_over?
    players.any?(&:won?)
  end

  def next_player!
    players.rotate!
  end

end
