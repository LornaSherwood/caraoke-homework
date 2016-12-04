require('minitest/autorun')
require 'minitest/rg'
require_relative('../guest.rb')
require_relative('../room.rb')

class GuestSpec < MiniTest::Test

  def test_guest_has_name
    guest = Guest.new("Mike", 50)
    assert_equal("Mike", guest.name)
  end

  def test_guest_has_money
    guest = Guest.new("Mike", 50)
    assert_equal(50, guest.wallet)
  end


end