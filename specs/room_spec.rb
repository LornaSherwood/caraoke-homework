require('minitest/autorun')
require 'minitest/rg'
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../viewer.rb')


class RoomSpec < MiniTest::Test

  def setup
    @viewer = Viewer.new
    @room_1 = Room.new("Country and Western")
    @room_2 = Room.new("Rock")
    @guest_1 = Guest.new("Mike")
    @guest_2 = Guest.new("Blaise")
    @song_1 = Song.new("American Idiot", "Greenday", "Don't wanna be an American idiot")
    @song_2 = Song.new("In the morning", "Razorlight", "Don't know what I'm doing wrong")
  end

  def test_room_has_theme
    assert_equal("Country and Western", @room_1.theme)
  end

  def test_room_can_check_in_guest    
    new_guest = @room_1.check_in_guest(@guest_1)
    assert_equal(["Mike"], new_guest)
  end

  def test_room_can_check_in_multiple_guests    
    @room_1.check_in_guest(@guest_1)
    @room_1.check_in_guest(@guest_2)
    assert_equal(2, @room_1.group.count)
  end

  def test_can_add_song
    song_list = @room_2.add_song(@song_1)
    assert_equal([["American Idiot", "Greenday", "Don't wanna be an American idiot"]], song_list)
  end

  def test_can_add_multiple_songs
    @room_2.add_song(@song_1)
    @room_2.add_song(@song_2)
    assert_equal(2, @room_2.song_list.count)
  end

  def test_guest_can_sing_song
    @room_2.check_in_guest(@guest_1)
    @room_2.check_in_guest(@guest_2)
    @room_2.add_song(@song_1)
    @room_2.add_song(@song_2)
    singing = @room_2.guest_can_sing_song(@guest_1, 1)
    assert_equal("Mike sings Don't know what I'm doing wrong.", singing )
  end

  def test_can_count_songs
    @room_2.check_in_guest(@guest_1)
    @room_2.add_song(@song_1)
    @room_2.guest_can_sing_song(@guest_1, 0)
    assert_equal(1, @room_2.song_total.count)
  end

  def test_can_check_out_guests
    @room_2.check_in_guest(@guest_1)
    @room_2.check_in_guest(@guest_2)
    @room_2.check_out_guests
    assert_equal(0, @room_2.group.count)
  end

  def test_can_end_session    
    @room_2.check_in_guest(@guest_1)
    @room_2.add_song(@song_1)
    @room_2.guest_can_sing_song(@guest_1, 0)
    @room_2.guest_can_sing_song(@guest_1, 0)
    @room_2.guest_can_sing_song(@guest_1, 0)
    @room_2.guest_can_sing_song(@guest_1, 0)
    @room_2.guest_can_sing_song(@guest_1, 0)
    @room_2.guest_can_sing_song(@guest_1, 0)
    @room_2.guest_can_sing_song(@guest_1, 0)
    @room_2.guest_can_sing_song(@guest_1, 0)
    @room_2.guest_can_sing_song(@guest_1, 0)
    @room_2.guest_can_sing_song(@guest_1, 0)

    assert_equal("Your session is over now.", @room_2.end_session)
    assert_equal(0, @room_2.group.count)
  end





end