require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/gymclass')

class TestGymClass < MiniTest::Test

  def setup
    @gymclass1 = GymClass.new({
    'gymclass_name' => 'MMA',
    'description' => 'Using techniques from different types of martial arts',
    'instructor' => 'Rhonda Rousey',
    'cost' => '5',
    'classtime' => 60
    })
  end

  def test_correct_gymclass_name
    assert_equal("MMA", @gymclass1.gymclass_name)
  end

  def test_gymclass_description
    assert_equal("Using techniques from different types of martial arts", @gymclass1.description)
  end

  def test_gymclass_instructor
    assert_equal("Rhonda Rousey", @gymclass1.instructor)
  end

  def test_gymclass_cost
    assert_equal(5, @gymclass1.cost)
  end

  def test_gymclass_time
    assert_equal(60, @gymclass1.classtime)
  end

end
