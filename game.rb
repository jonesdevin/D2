locations = {}

locations['Enumerable Canyon'] = { 'neighbors' =>
[
  'Duck Type Beach',
  'Monkey Patch City'
],
                                   'maxRubes' => 1,
                                   'maxFakes' => 1 }
locations['Duck Type Beach'] = { 'neighbors' =>
[
  'Enumerable Canyon',
  'Matzburg'
],
                                 'maxRubes' => 2,
                                 'maxFakes' => 2 }
locations['Monkey Patch City'] = { 'neighbors' =>
[
  'Nil Town',
  'Enumerable Canyon',
  'Matzburgh'
],
                                   'maxRubes' => 1,
                                   'maxFakes' => 1 }
locations['Matzburg'] = { 'neighbors' =>
[
  'Monkey Patch City',
  'Duck Type Beach',
  'Hash crossing',
  'Dynamic Palisades'
],
                          'maxRubes' => 3,
                          'maxFakes' => 0 }
locations['Nil Town'] = { 'neighbors' =>
[
  'Monkey Patch City',
  'Hash Crossing'
],
                          'maxRubes' => 0,
                          'maxFakes' => 3 }
locations['Hash Crossing'] = { 'neighbors' =>
[
  'Matzburg',
  'Nil Town',
  'Dynamic Palisades'
],
                               'maxRubes' => 2,
                               'maxFakes' => 2 }
locations['Dynamic Palisades'] = { 'neighbors' =>
[
  'Matzburg',
  'Hash Crossing'
],
                                   'maxRubes' => 2,
                                   'maxFakes' => 2 }

def game_engine(random_num, num_of_prospectors, num_of_turns)
  # Do stuff
end
