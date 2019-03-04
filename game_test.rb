require 'minitest/autorun'

require_relative 'game.rb'

class GameTest < MiniTest::Test
  # UNIT TESTS FOR METHOD plural_ruby(x)
  # Equivalence classes
  # x=1 => return "1 ruby"
  # x=0 => return ""
  # x=10000 => return "10000 rubies"
  def test_single_ruby
    game1 = Game.new
    assert_equal '1 ruby', game1.plural_ruby(1)
  end

  def test_no_rubies
    game1 = Game.new
    assert_equal '', game1.plural_ruby(0)
  end

  def test_many_rubies
    game1 = Game.new
    assert_equal '10000 rubies', game1.plural_ruby(10_000)
  end

  # UNIT TESTS FOR METHOD plural_fake(x)
  # Equivalence classes:
  # x=1 => return "1 fake ruby"
  # x=0 => return ""
  # x=10000 => return "10000 fake rubies"
  def test_single_fake
    game1 = Game.new
    assert_equal '1 fake ruby', game1.plural_fake(1)
  end

  def test_no_fakes
    game1 = Game.new
    assert_equal '', game1.plural_fake(0)
  end

  def test_many_fakes
    game1 = Game.new
    assert_equal '10000 fake rubies', game1.plural_fake(10_000)
  end

  # UNIT TESTS FOR METHOD print_rubyist_start(x)
  # Equivalence classes:
  # x= 1 -> "Rubyist #1 starting in Enumerable Canyon.\n"
  # x= 1000 -> "Rubyist #1000 starting in Enumerable Canyon.\n"
  # Prints to the console
  def test_rubyist_start_1
    game1 = Game.new
    assert_output ("Rubyist #1 starting in Enumerable Canyon.\n") { game1.print_rubyist_start(1) }
  end

  def test_rubyist_start_1000
    game1 = Game.new
    assert_output ("Rubyist #1000 starting in Enumerable Canyon.\n") { game1.print_rubyist_start(1000) }
  end

  # UNIT TESTS FOR METHOD print_heading_to(x, y)
  # Equivalence classes:
  # x= 'Enumberable Canyon' y= 'Monkey Patch City' -> "Heading from Enumerable Canyon to Monkey Patch City."
  # Prints to the console
  def test_heading_to
    game1 = Game.new
    assert_output ("Heading from Enumerable Canyon to Monkey Patch City.\n") { game1.print_heading_to('Enumerable Canyon', 'Monkey Patch City') }
  end

  # UNIT TESTS FOR METHOD new_town(a, b, c)
  # Equivalence classes:
  #
  def test_new_town
    game1 = Game.new
    locations = { 'Enumerable Canyon' =>
      { 'neighbors' =>
        ['Duck Type Beach', 'Monkey Patch City'],
        'maxRubes' => 1,
        'maxFakes' => 1 } }
    Random.stub(:rand, 0) do
      game1.stub(:print_heading_to, nil) do
        assert_equal 'Duck Type Beach', game1.new_town(Random, 'Enumerable Canyon', locations)
      end
    end
  end

  # UNIT TESTS FOR METHOD print_total(a)
  # Equivalence classes:
  # a = [0, 0, 0] => return "\t0 rubies\n\t0 fake rubies\n"
  # a = [0, 1, 0] => return "\t1 ruby\n\t0 fake rubies\n"
  # a = [0, 1, 1] => return "\t1 ruby\n\t1 fake ruby\n"
  # a = [0, 0, 1] => return "\t0 rubies\n\t1 fake ruby\n"
  # a = [0, 2, 2] => return "\t2 rubies\n\t2 fake rubies\n"
  def test_print_total_0_real_0_fake
    game1 = Game.new
    assert_output ("\t0 rubies\n\t0 fake rubies\n") { game1.print_total([0, 0, 0]) }
  end

  def test_print_total_1_real_0_fake
    game1 = Game.new
    assert_output ("\t1 ruby\n\t0 fake rubies\n") { game1.print_total([0, 1, 0]) }
  end

  def test_print_total_0_real_0_fake
    game1 = Game.new
    assert_output ("\t1 ruby\n\t1 fake ruby\n") { game1.print_total([0, 1, 1]) }
  end

  def test_print_total_0_real_0_fake
    game1 = Game.new
    assert_output ("\t0 rubies\n\t1 fake ruby\n") { game1.print_total([0, 0, 1]) }
  end

  def test_print_total_0_real_0_fake
    game1 = Game.new
    assert_output ("\t2 rubies\n\t2 fake rubies\n") { game1.print_total([0, 2, 2]) }
  end

  # UNIT TESTS FOR METHOD going_home(a)
  # Equivalence classes:
  # a=0 => return "Going home empty-handed."
  # a=9 => return "going_home_0"
  # a=1 => return "Going home sad."
  # a=10 => return "Going home victorious!"

  def test_going_home_0
    game1 = Game.new
    assert_output ("Going home empty-handed.\n") { game1.going_home(0) }
  end

  def test_going_home_9
    game1 = Game.new
    assert_output ("Going home sad.\n") { game1.going_home(9) }
  end

  def test_going_home_1
    game1 = Game.new
    assert_output ("Going home sad.\n") { game1.going_home(1) }
  end

  def test_going_home_10
    game1 = Game.new
    assert_output ("Going home victorious!\n") { game1.going_home(10) }
  end

  # UNIT TESTS FOR METHOD stay(a)
  # Equivalence classes:
  # a=[0,0]  => return false
  # a=[1,0]  => return truth
  # a=[0,1]  => return truth
  # a=[1,1]  => return truth

  def test_say_real_0_fake_0
    game1 = Game.new
    assert_equal(false, game1.stay([0, 0]))
  end

  def test_say_real_1_fake_0
    game1 = Game.new
    assert_equal(true, game1.stay([1, 0]))
  end

  def test_say_real_0_fake_1
    game1 = Game.new
    assert_equal(true, game1.stay([0, 1]))
  end

  def test_say_real_1_fake_1
    game1 = Game.new
    assert_equal(true, game1.stay([1, 1]))
  end

  # UNIT TESTS FOR METHOD addition_helper(a, b)
  # Equivalence classes:
  # a = [0, 0, 0] b= [0,0] => [1, 0, 0]
  # a = [1, 0, 0] b= [1,0] => [2, 1, 0]
  # a = [2, 0, 0] b= [0,1] => [3, 0, 1]
  # a = [3, 0, 2] b= [3,0] => [4, 3, 2]

  def test_addition_helper_0
    game1 = Game.new
    assert_equal([1, 0, 0], game1.addition_helper([0, 0, 0], [0, 0]))
  end

  def test_addition_helper_1
    game1 = Game.new
    assert_equal([2, 1, 0], game1.addition_helper([1, 0, 0], [1, 0]))
  end

  def test_addition_helper_2
    game1 = Game.new
    assert_equal([3, 0, 1], game1.addition_helper([2, 0, 0], [0, 1]))
  end

  def test_addition_helper_3
    game1 = Game.new
    assert_equal([4, 3, 2], game1.addition_helper([3, 0, 2], [3, 0]))
  end

  # UNIT TESTS FOR METHOD mine_rubies(a, b, c)
  # Equivalence classes:
  # stubbed rand method to return 0 for both calls and should return [0, 0]
  def test_mine_rubies
    game1 = Game.new
    locations = { 'Enumerable Canyon' =>
      { 'neighbors' =>
        ['Duck Type Beach', 'Monkey Patch City'],
        'maxRubes' => 1,
        'maxFakes' => 1 } }
    Random.stub(:rand, 0) do
      game1.stub(:print_rubies_found, nil) do
        assert_equal [0, 0], game1.mine_rubies(Random, 'Enumerable Canyon', locations)
      end
    end
  end

  # UNIT TESTS FOR METHOD print_rubies_found(a, b)
  # Equivalence classes:
  # a = [0, 0] b = 'Enumerable Canyon'=> return "\tFound no rubies or fake rubies in Enumerable Canyon\n"
  # a = [1, 0] b = 'Enumerable Canyon'=> return "\tFound 1 ruby in Enumerable Canyon\n"
  # a = [0, 1] b = 'Enumerable Canyon'=> return "\tFound 1 fake ruby in Enumerable Canyon\n"
  # a = [1, 1] b = 'Enumerable Canyon'=> return "\tFound 1 ruby and 1 fake ruby in Enumerable Canyon\n"
  # a = [2, 1] b = 'Enumerable Canyon'=> return "\tFound 2 rubies and 1 fake ruby in Enumerable Canyon\n"
  # a = [1, 2] b = 'Enumerable Canyon'=> return "\tFound 1 ruby or 2 fake rubies in Enumerable Canyon\n"
  # a = [3, 3] b = 'Enumerable Canyon'=> return "\tFound 3 rubies and 3 fake rubies in Enumerable Canyon\n"

  def test_rubies_found_real_0_fake_0
    game1 = Game.new
    game1.stub(:plural_ruby, '0 rubies') do
      game1.stub(:plural_fake, '0 fake rubies') do
        assert_output ("\tFound no rubies or fake rubies in Enumerable Canyon\n") { game1.print_rubies_found([0, 0], 'Enumerable Canyon') }
      end
    end
  end

  def test_rubies_found_real_1_fake_0
    game1 = Game.new
    game1.stub(:plural_ruby, '1 ruby') do
      game1.stub(:plural_fake, '0 fake rubies') do
        assert_output ("\tFound 1 ruby in Enumerable Canyon\n") { game1.print_rubies_found([1, 0], 'Enumerable Canyon') }
      end
    end
  end

  def test_rubies_found_real_0_fake_1
    game1 = Game.new
    game1.stub(:plural_ruby, '0 rubies') do
      game1.stub(:plural_fake, '1 fake ruby') do
        assert_output ("\tFound 1 fake ruby in Enumerable Canyon\n") { game1.print_rubies_found([0, 1], 'Enumerable Canyon') }
      end
    end
  end

  def test_rubies_found_real_1_fake_1
    game1 = Game.new
    game1.stub(:plural_ruby, '1 ruby') do
      game1.stub(:plural_fake, '1 fake ruby') do
        assert_output ("\tFound 1 ruby and 1 fake ruby in Enumerable Canyon\n") { game1.print_rubies_found([1, 1], 'Enumerable Canyon') }
      end
    end
  end

  def test_rubies_found_real_2_fake_1
    game1 = Game.new
    game1.stub(:plural_ruby, '2 rubies') do
      game1.stub(:plural_fake, '1 fake ruby') do
        assert_output ("\tFound 2 rubies and 1 fake ruby in Enumerable Canyon\n") { game1.print_rubies_found([2, 1], 'Enumerable Canyon') }
      end
    end
  end

  def test_rubies_found_real_1_fake_2
    game1 = Game.new
    game1.stub(:plural_ruby, '1 ruby') do
      game1.stub(:plural_fake, '2 fake rubies') do
        assert_output ("\tFound 1 ruby and 2 fake rubies in Enumerable Canyon\n") { game1.print_rubies_found([1, 2], 'Enumerable Canyon') }
      end
    end
  end

  def test_rubies_found_real_2_fake_2
    game1 = Game.new
    game1.stub(:plural_ruby, '2 rubies') do
      game1.stub(:plural_fake, '2 fake rubies') do
        assert_output ("\tFound 2 rubies and 2 fake rubies in Enumerable Canyon\n") { game1.print_rubies_found([2, 2], 'Enumerable Canyon') }
      end
    end
  end

  # UNIT TESTS FOR METHOD mining(a, b, c, d)
  # Equivalence classes:
  # a= (Random) b= 0 c= 0 d= 0
  # EDGE CASE b is 0 (no turns)

  def test_mining
    game1 = Game.new
    assert_equal [0, 0, 0], game1.mining(Random, 0, 0, 0)
  end

  def test_mining_1_turn
    game1 = Game.new
    game1.stub(:mine_rubies, [0, 0]) do
      game1.stub(:new_town, nil) do
        assert_equal [1, 0, 0], game1.mining(Random, 2, 0, 0)
      end
    end
  end
end
