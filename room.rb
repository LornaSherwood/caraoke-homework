 class Room

  attr_reader :theme, :room_maximum, :cost
  attr_accessor :group, :song_list, :song_total

  def initialize(theme, room_maximum, cost)
    @theme = theme
    @group = []
    @song_list = []
    @song_total = []
    @room_maximum = room_maximum
    @cost = cost
  end

  def check_in_guest(guest)
    if group.count >= room_maximum
      return "The room can only take #{@room_maximum} people."
    else
      group << [guest.name, guest.wallet] #changed from guest.name
      guest.wallet -= @cost
      return group
    end
  end

  def add_song(song)
    song_list << [song.title, song.artist, song.first_line]
    return song_list
  end

  def guest_can_sing_song(name, song_number)
    for g in @group 
      if g[0] == name
        song_total << 1
        return "#{g[0]} sings #{song_list[song_number][2]}."
      end
    end
      return "You must choose someone in the room to sing."
  
  end

  def check_out_guests
    return group.clear
  end

  def end_session
    @group.clear
    return "Your session is over now."    
  end

end