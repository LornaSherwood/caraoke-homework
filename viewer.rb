class Viewer

  def get_player_name
    puts "Who would like to sing next?"
    return gets.chomp
  end

  def get_song_choice
    puts "Choose a song number between 1 and 10"
    return gets.chomp
  end 

end
