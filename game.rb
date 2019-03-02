require_relative 'locations.rb'

def mine_rubies(ruby_finder, location_name, locations)
  real_rubies = ruby_finder.rand(locations[location_name]['maxRubes'] + 1)
  fake_rubies = ruby_finder.rand(locations[location_name]['maxFakes'] + 1)
  print_rubies_found([real_rubies, fake_rubies], location_name)
  [real_rubies, fake_rubies]
end

def print_rubyist_start(id)
  puts "Rubyist ##{id} starting in Enumerable Canyon."
end

def print_heading_to(old_location, c_loc)
  puts "Heading from #{old_location} to #{c_loc}."
end

def new_town(town_finder, old_location, locations)
  rand_town = town_finder.rand(locations[old_location]['neighbors'].size)
  new_location = locations[old_location]['neighbors'][rand_town]
  print_heading_to(old_location, new_location)
  new_location
end

def plural_ruby(number)
  if number.zero? then ''
  elsif number == 1 then "#{number} ruby"
  else "#{number} rubies"
  end
end

def plural_fake(number)
  if number.zero? then ''
  elsif number == 1 then "#{number} fake ruby"
  else "#{number} fake rubies"
  end
end

def print_rubies_found(rubies, loc)
  real = rubies[0]
  fake = rubies[1]

  if !real.zero? && !fake.zero?
    puts "\tFound #{plural_ruby(real)} and #{plural_fake(fake)} in #{loc}"
  elsif real.zero? && fake.zero?
    puts "\tFound no rubies or fake rubies in #{loc}"
  else puts found_one_kind_of_ruby(rubies, loc)
  end
end

def found_one_kind_of_ruby(rubies, loc)
  if !rubies[0].zero? && rubies[1].zero?
    "\tFound #{plural_ruby(rubies[0])} in #{loc}"
  elsif rubies[0].zero? && !rubies[1].zero?
    "\tFound #{plural_fake(rubies[1])} in #{loc}"
  end
end

def print_total(rubies)
  if rubies[1] != 1 then puts "\t#{rubies[1]} rubies"
  else puts "\t#{rubies[1]} ruby"
  end
  if rubies[2] != 1 then puts "\t#{rubies[2]} fake rubies"
  else puts "\t#{rubies[2]} fake ruby"
  end
end

def going_home(real_rubies)
  if real_rubies > 9 then puts 'Going home victorious!'
  elsif real_rubies.between?(1, 9) then puts 'Going home sad.'
  else puts 'Going home empty-handed.'
  end
end

def stay(rubies)
  rubies[0] > 0 || rubies[1] > 0
end

def addition_helper(data, rubs)
  data[0] += 1
  data[1] += rubs[0]
  data[2] += rubs[1]

  data
end

def mining(r_num, num_t, loc, c_loc)
  # Do stuff
  turns = 1
  data = 0, 0, 0
  while turns < num_t && num_t != 0
    rubs = mine_rubies(r_num, c_loc, loc)
    turns += 1 unless stay(rubs)
    c_loc = new_town(r_num, c_loc, loc) unless stay(rubs[0]) || turns == num_t
    data = addition_helper(data, rubs)
  end
  data
end

def game_engine(r_num, num_of_prospectors, num_t, loc)
  (1..num_of_prospectors).each do |index|
    print_rubyist_start(index)
    data = mining(r_num, num_t, loc, 'Enumerable Canyon')
    puts "After #{data[0]} days Rubyist ##{index} found:"
    print_total(data)
    going_home(data[1])
  end
end

game_engine(Random.new(1), 2, 6, init_locations)
