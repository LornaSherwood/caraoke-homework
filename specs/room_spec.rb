require('minitest/autorun')
require 'minitest/rg'
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')


class RoomSpec < MiniTest::Test

  def test_room_has_theme
    room = Room.new("Country and Western")
    assert_equal("Country and Western", room.theme)
  end

  def test_room_can_check_in_guest
    room = Room.new("Country and Western")
    guest_1 = Guest.new("Mike")
    new_guest = room.check_in_guest(guest_1)
    assert_equal(["Mike"], new_guest)
  end

  def test_room_can_check_in_multiple_guests
    room = Room.new("Country and Western")
    guest_1 = Guest.new("Mike")
    guest_2 = Guest.new("Blaise")
    
    room.check_in_guest(guest_1)
    room.check_in_guest(guest_2)

    assert_equal(2, room.group.count)
  end

  def test_can_add_song
    room = Room.new("Rock")
    song = Song.new("American Idiot", "Greenday", "Don't wanna be an American idiot")
    song_list = room.add_song(song)
    assert_equal([["American Idiot", "Greenday", "Don't wanna be an American idiot"]], song_list)
  end

  def test_can_add_multiple_songs
    room = Room.new("Rock")
    song = Song.new("American Idiot", "Greenday", "Don't wanna be an American idiot")
    song_2 = Song.new("In the morning", "Razorlight", "Don't know what I'm doing wrong")

    room.add_song(song)
    room.add_song(song_2)

    assert_equal(2, room.song_list.count)
  end

  # def test_can_choose_song_from_list
  #   room = Room.new("Rock")
  #   song = Song.new("American Idiot", "Greenday", "Don't wanna be an American idiot")
  #   song_2 = Song.new("In the morning", "Razorlight", "Don't know what I'm doing wrong")

  #   room.add_song(song)
  #   room.add_song(song_2)
  #   chosen_song = room.choose_song(1)

  #   assert_equal(["In the morning", "Razorlight", "Don't know what I'm doing wrong"],  chosen_song)
  # end

  def test_guest_can_sing_song
    room = Room.new("Rock")
    song = Song.new("American Idiot", "Greenday", "Don't wanna be an American idiot")
    song_2 = Song.new("In the morning", "Razorlight", "Don't know what I'm doing wrong")
    guest_1 = Guest.new("Mike")
    guest_2 = Guest.new("Blaise")
    
    room.check_in_guest(guest_1)
    room.check_in_guest(guest_2)
    room.add_song(song)
    room.add_song(song_2)
    singing = room.guest_can_sing_song(guest_1, 1)
    assert_equal("Mike sings Don't know what I'm doing wrong.", singing )
  end

  def test_can_count_songs
    room = Room.new("Rock")
    song = Song.new("American Idiot", "Greenday", "Don't wanna be an American idiot")
    guest_1 = Guest.new("Mike")
 
    room.check_in_guest(guest_1)
    room.add_song(song)
    room.guest_can_sing_song(guest_1, 0)

    assert_equal(1, room.song_total.count)
  end

  # def test_can_end_session?
  #   room = Room.new("Rock")
  #   song = Song.new("American Idiot", "Greenday", "Don't wanna be an American idiot")
  #   guest_1 = Guest.new("Mike")
    
  #   room.check_in_guest(guest_1)
  #   room.add_song(song)
  #   room.guest_can_sing_song(guest_1, 0)

  #   assert_equal("Your session is over now", room.end_session?)
  # end

  def test_can_check_out_guests
    room = Room.new("Rock")
    guest_1 = Guest.new("Mike")
    guest_2 = Guest.new("Blaise")

    room.check_in_guest(guest_1)
    room.check_in_guest(guest_2)
    room.check_out_guests

    assert_equal(0, room.group.count)
  end



end