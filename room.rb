 class Room

  attr_reader :theme, :room_maximum
  attr_accessor :group, :song_list, :song_total

  def initialize(theme, room_maximum)
    @theme = theme
    @group = []
    @song_list = []
    @song_total = []
    @room_maximum = room_maximum
  end

  def check_in_guest(guest)
    if @group.count >= @room_maximum
      return "The room can only take #{@room_maximum} people."
    else
      group << guest.name
      return group
    end
  end

  def add_song(song)
    song_list << [song.title, song.artist, song.first_line]
    return song_list
  end

  def guest_can_sing_song(guest, song_number)
    song_total << 1
    return "#{guest.name} sings #{song_list[song_number][2]}."
  end

  def check_out_guests
    return group.clear
  end

  def end_session
    if song_total.count >= 10
      group.clear
      return "Your session is over now."
    end
  end

 

end