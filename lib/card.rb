# -*- coding: utf-8 -*-

# Represents a playing card.
class Card
  SUIT_STRINGS = {
    :clubs    => "♣",
    :diamonds => "♦",
    :hearts   => "♥",
    :spades   => "♠"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  SUPER8_VALUE = {
    :ace => 1,
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 50,
    :nine  => 9,
    :ten   => 10,
    :jack  => 10,
    :queen => 10,
    :king  => 10
  }


  # Returns an array of all suits.
  def self.suits
    SUIT_STRINGS.keys
  end

  # Returns an array of all values.
  def self.values
    VALUE_STRINGS.keys
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    unless Card.suits.include?(suit) && Card.values.include?(value)
      raise "illegal suit (#{suit}) or value (#{value})"
    end

    @suit, @value = suit, value
  end

  def super8_value
    SUPER8_VALUE[value]
  end

  def super8_action
    # case value
    # when :ace then :defense
    # when :deuce then :take_two_cards
    # when :
    #
    # ace: :defense,
    #   deuce: :take_two_cards,
    #   king: :play_again,
    #   jack: :reverse
  end

  def to_s
    VALUE_STRINGS[value] + SUIT_STRINGS[suit]
  end
end
