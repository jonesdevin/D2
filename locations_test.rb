require 'minitest/autorun'
require 'simplecov'
SimpleCov.start
require_relative 'locations.rb'

# test for locations.rb
class LocationsTest < Minitest::Test
  def setup
    @l = Locations.new
    @li = @l.init_locations
  end

  # UNIT TESTS FOR METHOD enumerable_canyon
  # Equivalence classes:
  # enumerable_canyon['neighbors'] => returns ['Duck Type Beach', 'Monkey Patch City']
  # enumerable_canyon['maxRubes'] => returns 1
  # enumerable_canyon['maxFakes'] => returns 1
  def test_enumerable_canyon_neighbors
    loc = Locations.new
    assert_equal ({ 'neighbors' =>
    ['Duck Type Beach', 'Monkey Patch City'],
                    'maxRubes' => 1,
                    'maxFakes' => 1 }), loc.enumerable_canyon
  end

  def test_enumerable_canyon_max_rubes
    assert_equal 1, @l.enumerable_canyon['maxRubes']
  end

  def test_enumerable_canyon_max_fakes
    assert_equal 1, @l.enumerable_canyon['maxFakes']
  end

  # UNIT TESTS FOR METHOD monkey_patch_city
  # Equivalence classes:
  # monkey_patch_city['neighbors'] => returns ['Nil Town', 'Enumerable Canyon', 'Matzburg']
  # monkey_patch_city['maxRubes'] => returns 1
  # monkey_patch_city['maxFakes'] => returns 1
  def test_monkey_patch_city_neighbors
    assert_equal ['Nil Town', 'Enumerable Canyon', 'Matzburg'], @l.monkey_patch_city['neighbors']
  end

  def test_monkey_patch_city_max_rubes
    assert_equal 1, @l.monkey_patch_city['maxRubes']
  end

  def test_monkey_patch_city_max_fakes
    assert_equal 1, @l.monkey_patch_city['maxFakes']
  end

  # UNIT TESTS FOR METHOD duck_type_beach
  # Equivalence classes:
  # duck_type_beach['neighbors'] => returns ['Enumerable Canyon', 'Matzburg']
  # duck_type_beach['maxRubes'] => returns 2
  # duck_type_beach['maxFakes'] => returns 2
  def test_duck_type_beach_neighbors
    assert_equal ['Enumerable Canyon', 'Matzburg'], @l.duck_type_beach['neighbors']
  end

  def test_duck_type_beach_max_rubes
    assert_equal 2, @l.duck_type_beach['maxRubes']
  end

  def test_duck_type_beach_max_fakes
    assert_equal 2, @l.duck_type_beach['maxFakes']
  end

  # UNIT TESTS FOR METHOD matzburg
  # Equivalence classes:
  # matzburg['neighbors'] => returns ['Monkey Patch City', 'Duck Type Beach', 'Hash Crossing', 'Dynamic Palisades']
  # matzburg['maxRubes'] => returns 3
  # matzburg['maxFakes'] => returns 0
  def test_matzburg_neighbors
    assert_equal ['Monkey Patch City', 'Duck Type Beach', 'Hash Crossing', 'Dynamic Palisades'], @l.matzburg['neighbors']
  end

  def test_matzburg_max_rubes
    assert_equal 3, @l.matzburg['maxRubes']
  end

  def test_matzburg_max_fakes
    assert_equal 0, @l.matzburg['maxFakes']
  end

  # UNIT TESTS FOR METHOD nil_town
  # Equivalence classes:
  # nil_town['neighbors'] => returns ['Monkey Patch City', 'Hash Crossing']
  # nil_town['maxRubes'] => returns 0
  # nil_town['maxFakes'] => returns 3
  def test_nil_town_neighbors
    assert_equal ['Monkey Patch City', 'Hash Crossing'], @l.nil_town['neighbors']
  end

  def test_nil_town_max_rubes
    assert_equal 0, @l.nil_town['maxRubes']
  end

  def test_nil_town_max_fakes
    assert_equal 3, @l.nil_town['maxFakes']
  end

  # UNIT TESTS FOR METHOD hash_crossing
  # Equivalence classes:
  # hash_crossing['neighbors'] => returns ['Matzburg', 'Nil Town', 'Dynamic Palisades']
  # hash_crossing['maxRubes'] => returns 2
  # hash_crossing['maxFakes'] => returns 2
  def test_hash_crossing_neighbors
    assert_equal ['Matzburg', 'Nil Town', 'Dynamic Palisades'], @l.hash_crossing['neighbors']
  end

  def test_hash_crossing_max_rubes
    assert_equal 2, @l.hash_crossing['maxRubes']
  end

  def test_hash_crossing_max_fakes
    assert_equal 2, @l.hash_crossing['maxFakes']
  end

  # UNIT TESTS FOR METHOD dynamic_palisades
  # Equivalence classes:
  # dynamic_palisades['neighbors'] => returns ['Matzburg', 'Hash Crossing']
  # dynamic_palisades['maxRubes'] => returns 2
  # dynamic_palisades['maxFakes'] => returns 2
  def test_dynamic_palisades_neighbors
    assert_equal ['Matzburg', 'Hash Crossing'], @l.dynamic_palisades['neighbors']
  end

  def test_dynamic_palisades_max_rubes
    assert_equal 2, @l.dynamic_palisades['maxRubes']
  end

  def test_dynamic_palisades_max_fakes
    assert_equal 2, @l.dynamic_palisades['maxFakes']
  end

  ######################################
  # UNIT TEST FOR METHOD @li['Enumerable Canyon']
  # Equivalence classes:
  # @li['Enumerable Canyon']['neighbors'] => returns ['Duck Type Beach', 'Monkey Patch City']
  # @li['Enumerable Canyon']['maxRubes'] => returns 1
  # @li['Enumerable Canyon']['maxFakes'] => returns 1

  def test_init_enumerable_canyon_neighbors
    assert_equal ['Duck Type Beach', 'Monkey Patch City'], @li['Enumerable Canyon']['neighbors']
  end

  def test_init_enumerable_canyon_max_rubes
    assert_equal 1, @li['Enumerable Canyon']['maxRubes']
  end

  def test_init_enumerable_canyon_max_fakes
    assert_equal 1, @li['Enumerable Canyon']['maxFakes']
  end

  # UNIT TESTS FOR @li['Monkey Patch City']
  # Equivalence classes:
  # @li['Monkey Patch City']['neighbors'] => returns ['Nil Town', 'Enumerable Canyon', 'Matzburg']
  # @li['Monkey Patch City']'maxRubes'] => returns 1
  # @li['Monkey Patch City']['maxFakes'] => returns 1
  def test_init_monkey_patch_city_neighbors
    assert_equal ['Nil Town', 'Enumerable Canyon', 'Matzburg'], @li['Monkey Patch City']['neighbors']
  end

  def test_init_monkey_patch_city_max_rubes
    assert_equal 1, @li['Monkey Patch City']['maxRubes']
  end

  def test_init_monkey_patch_city_max_fakes
    assert_equal 1, @li['Monkey Patch City']['maxFakes']
  end

  # UNIT TESTS FOR METHOD @li['Duck Type Beach']
  # Equivalence classes:
  # @li['Duck Type Beach']['neighbors'] => returns ['Enumerable Canyon', 'Matzburg']
  # @li['Duck Type Beach']['maxRubes'] => returns 2
  # @li['Duck Type Beach']['maxFakes'] => returns 2
  def test_init_duck_type_beach_neighbors
    assert_equal ['Enumerable Canyon', 'Matzburg'], @li['Duck Type Beach']['neighbors']
  end

  def test_init_duck_type_beach_max_rubes
    assert_equal 2, @li['Duck Type Beach']['maxRubes']
  end

  def test_init_duck_type_beach_max_fakes
    assert_equal 2, @li['Duck Type Beach']['maxFakes']
  end

  # UNIT TESTS FOR METHOD @li['Matzburg']
  # Equivalence classes:
  # @li['Matzburg']['neighbors'] => returns ['Monkey Patch City', 'Duck Type Beach', 'Hash Crossing', 'Dynamic Palisades']
  # @li['Matzburg']['maxRubes'] => returns 3
  # @li['Matzburg']['maxFakes'] => returns 0
  def test_init_matzburg_neighbors
    assert_equal ['Monkey Patch City', 'Duck Type Beach', 'Hash Crossing', 'Dynamic Palisades'], @li['Matzburg']['neighbors']
  end

  def test_init_matzburg_max_rubes
    assert_equal 3, @li['Matzburg']['maxRubes']
  end

  def test_init_matzburg_max_fakes
    assert_equal 0, @li['Matzburg']['maxFakes']
  end

  # UNIT TESTS FOR METHOD @li['Nil Town'][
  # Equivalence classes:
  # @li['Nil Town']['neighbors'] => returns ['Monkey Patch City', 'Hash Crossing']
  # @li['Nil Town']['maxRubes'] => returns 0
  # @li['Nil Town']['maxFakes'] => returns 3
  def test_init_nil_town_neighbors
    assert_equal ['Monkey Patch City', 'Hash Crossing'], @li['Nil Town']['neighbors']
  end

  def test_init_nil_town_max_rubes
    assert_equal 0, @li['Nil Town']['maxRubes']
  end

  def test_init_nil_town_max_fakes
    assert_equal 3, @li['Nil Town']['maxFakes']
  end

  # UNIT TESTS FOR METHOD @li['Hash Crossing']
  # Equivalence classes:
  # @li['Hash Crossing']['neighbors'] => returns ['Matzburg', 'Nil Town', 'Dynamic Palisades']
  # @li['Hash Crossing']['maxRubes'] => returns 2
  # @li['Hash Crossing']['maxFakes'] => returns 2
  def test_init_hash_crossing_neighbors
    assert_equal ['Matzburg', 'Nil Town', 'Dynamic Palisades'], @li['Hash Crossing']['neighbors']
  end

  def test_init_hash_crossing_max_rubes
    assert_equal 2, @li['Hash Crossing']['maxRubes']
  end

  def test_init_hash_crossing_max_fakes
    assert_equal 2, @li['Hash Crossing']['maxFakes']
  end

  # UNIT TESTS FOR METHOD @li['Dynamic Palisades']
  # Equivalence classes:
  # @li['Dynamic Palisades']['neighbors'] => returns ['Matzburg', 'Hash Crossing']
  # @li['Dynamic Palisades']['maxRubes'] => returns 2
  # @li['Dynamic Palisades']['maxFakes'] => returns 2
  def test_init_dynamic_palisades_neighbors
    assert_equal ['Matzburg', 'Hash Crossing'], @li['Dynamic Palisades']['neighbors']
  end

  def test_init_dynamic_palisades_max_rubes
    assert_equal 2, @li['Dynamic Palisades']['maxRubes']
  end

  def test_init_dynamic_palisades_max_fakes
    assert_equal 2, @li['Dynamic Palisades']['maxFakes']
  end

  def test_try_it
    assert @l.init_locations.is_a?(Hash)
  end

end
