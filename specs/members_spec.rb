require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/members')

class TestMember < MiniTest::Test

  def setup
    @member1 = Member.new({
    'first_name' => 'Ricky',
    'last_name' => 'Corrigan',
    'membership_type' => 'Basic'
    })
  end

    def test_member_first_name
      assert_equal("Ricky", @member1.first_name)
    end

    def test_member_last_name
      assert_equal("Corrigan", @member1.last_name)
    end

    def test_member_membership_type
      assert_equal("Basic", @member1.membership_type)
    end

end
