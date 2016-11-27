require_relative 'lib/game'
require 'byebug'

p1 = Player.new("Bob")
p2 = Player.new("Scott")
p3 = Player.new("John")

game = Game.new([p1, p2, p3])

game.play_super_eight
