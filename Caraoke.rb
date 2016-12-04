require_relative 'guest.rb'
require_relative 'room.rb'
require_relative 'viewer.rb'
require_relative 'song.rb'

class Caraoke

  def initialize(viewer)
    @viewer = viewer
    # @room_1 = Room.new("Country and Western", 4, 10)
    @room_2 = Room.new("Rock", 4, 10)
    @guest_1 = Guest.new("Mike", 50)
    @guest_2 = Guest.new("Blaise", 100)
    @guest_3 = Guest.new("Julia", 75)
    @song_1 = Song.new("American Idiot", "Greenday", "Don't wanna be an American idiot")
    @song_2 = Song.new("In the morning", "Razorlight", "Don't know what I'm doing wrong")
    @song_3 = Song.new("Human", "The Killers", "I did my best to notice")
    @song_4 = Song.new("Time is running out", "Muse", "I think I'm drowning")
  end


  def run

    @room_2.check_in_guest(@guest_1)
    @room_2.check_in_guest(@guest_2)
    @room_2.check_in_guest(@guest_3)
    @room_2.add_song(@song_1)
    @room_2.add_song(@song_2)
    @room_2.add_song(@song_3)
    @room_2.add_song(@song_4)

    
    while @room_2.song_total.count < 10 do
      puts @room_2.guest_can_sing_song(@viewer.get_player_name , @viewer.get_song_choice) 
    end

    puts @room_2.end_session
 
    

  end



end

game = Caraoke.new(Viewer.new)
game.run()

