require_relative 'game.rb'
require_relative 'locations.rb'
require_relative 'msg.rb'

args = ARGV.to_a.map(&:to_i)
msg if args.length != 3 || !args.all?(&:integer?) || args[1] < 0 || args[2] < 0

game_engine(Random.new(args[0]), args[1], args[2], init_locations)
