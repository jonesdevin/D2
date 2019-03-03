require_relative 'game.rb'
require_relative 'locations.rb'
require_relative 'msg.rb'

args = ARGV.to_a.map(&:to_i)
msg if args.length != 3 || !args.all?(&:integer?) || args[1] < 0 || args[2] < 0

def game_engine(r_num, num_of_prospectors, num_t, loc)
  p = Game.new
  (1..num_of_prospectors).each do |index|
    puts num_t
    p.print_rubyist_start(index)
    data = p.mining(r_num, num_t, loc, 'Enumerable Canyon')
    puts "After #{data[0]} days Rubyist ##{index} found:"
    p.print_total(data)
    p.going_home(data[1])
  end
end

game_engine(Random.new(args[0]), args[1], args[2], init_locations)
