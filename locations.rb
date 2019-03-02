def enumerable_canyon
  { 'neighbors' =>
  ['Duck Type Beach', 'Monkey Patch City'],
    'maxRubes' => 1,
    'maxFakes' => 1 }
end

def duck_type_beach
  { 'neighbors' =>
  ['Enumerable Canyon', 'Matzburg'],
    'maxRubes' => 2,
    'maxFakes' => 2 }
end

def monkey_patch_city
  { 'neighbors' =>
  ['Nil Town', 'Enumerable Canyon', 'Matzburg'],
    'maxRubes' => 1,
    'maxFakes' => 1 }
end

def matzburg
  { 'neighbors' =>
    [
      'Monkey Patch City', 'Duck Type Beach',
      'Hash Crossing', 'Dynamic Palisades'
    ],
    'maxRubes' => 3,
    'maxFakes' => 0 }
end

def nil_town
  { 'neighbors' =>
    ['Monkey Patch City', 'Hash Crossing'],
    'maxRubes' => 0,
    'maxFakes' => 3 }
end

def hash_crossing
  { 'neighbors' =>
    ['Matzburg', 'Nil Town', 'Dynamic Palisades'],
    'maxRubes' => 2,
    'maxFakes' => 2 }
end

def dynamic_palisades
  { 'neighbors' =>
    ['Matzburg', 'Hash Crossing'],
    'maxRubes' => 2,
    'maxFakes' => 2 }
end

def init_locations
  locations = {}
  locations['Enumerable Canyon'] = enumerable_canyon
  locations['Duck Type Beach'] = duck_type_beach
  locations['Monkey Patch City'] = monkey_patch_city
  locations['Matzburg'] = matzburg
  locations['Nil Town'] = nil_town
  locations['Hash Crossing'] = hash_crossing
  locations['Dynamic Palisades'] = dynamic_palisades
  locations
end
