class Game

  def initialize(*players)
    set_players
  end

  def play_super_eight
    init_deck
    until game_over?
      play_round
    end
  end

  def play_round
    shuffle_deck
    each_player_take_five_cards
    set_initial_card_for_stock

    until round_over?
      players.first.play_round
      next_player!
    end

    calculate_points
    take_cards_from_players_to_deck
  end



  def next_player!
  end

end
