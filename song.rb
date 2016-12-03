class Song

  attr_reader :title, :artist, :first_line

  def initialize(title, artist, first_line)
    @title = title
    @artist = artist
    @first_line = first_line
  end

  def first_line
    return @first_line
  end

  def play_song
    return @first_line
  end



end