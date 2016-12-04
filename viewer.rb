class Viewer

  # def choose_room
  #   puts "Which room would you like to join #{{room.room_1.theme} or room.room_2.theme}?"
  #   return gets.chomp
  # end

  def get_player_name
    puts "Who would like to sing next?"
    return gets.chomp.to_s
  end

  def get_song_choice
    puts "Choose a song number between 1 and 4"
    return gets.chomp.to_i
  end 

end
