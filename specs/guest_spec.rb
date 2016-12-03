require('minitest/autorun')
require 'minitest/rg'
require_relative('../guest.rb')
require_relative('../room.rb')

class GuestSpec < MiniTest::Test

  def test_guest_has_name
    guest = Guest.new("Mike")
    assert_equal("Mike", guest.name)
  end




end