require('minitest/autorun')
require 'minitest/rg'
require_relative('../song.rb')

class SongSpec < MiniTest::Test

  def test_song_has_title
    song = Song.new("American Idiot", "Greenday", "Don't wanna be an American idiot")
    assert_equal("American Idiot", song.title)
  end

  def test_song_has_artist
    song = Song.new("American Idiot", "Greenday", "Don't wanna be an American idiot")
    assert_equal("Greenday", song.artist)
  end

  def test_song_has_first_line
    song = Song.new("American Idiot", "Greenday", "Don't wanna be an American idiot")
    assert_equal("Don't wanna be an American idiot", song.first_line)
  end

  def test_can_play_song
    song = Song.new("In the morning", "Razorlight", "Don't know what I'm doing wrong")
   
    assert_equal("Don't know what I'm doing wrong", song.play_song)
  end


end