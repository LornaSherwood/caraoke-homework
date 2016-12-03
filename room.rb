 class Room

  attr_reader :theme
  attr_accessor :group, :song_list, :song_total

  def initialize(theme)
    @theme = theme
    @group = []
    @song_list = []
    @song_total = []

  end

  def check_in_guest(guest)
    group << guest.name
    return group
  end

  def add_song(song)
    song_list << [song.title, song.artist, song.first_line]
    return song_list
  end

  # def choose_song(num)
  #   return song_list[num]
  # end

  def guest_can_sing_song(guest, song_number)
    song_total << 1
    return "#{guest.name} sings #{song_list[song_number][2]}."
  end

  # def end_session?
  #   viewer.end_session if song_total == 10
  # end

  def check_out_guests
    return group.clear
  end


end