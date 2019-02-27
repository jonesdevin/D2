def msg
  print 'Usage:
  ruby ruby_rush.rb *seed* *num_prospectors* *num_turns*
  *seed* should be an integer
  *num_prospectors* should be a non-negative integer
  *num_turns* should be a non-negative integer'
  exit(1)
end

args = ARGV.to_a.map(&:to_i)
msg if args.length != 3 || !args.all?(&:integer?) || args[1] < 0 || args[2] < 0
