class MusicLibraryController
  def initialize(filepath='./db/mp3s')
    importer = MusicImporter.new(filepath)
    importer.import
  end

  def call
    command = ""
    while command != 'exit'
      puts("Welcome to your music library!")
      puts("To list all of your songs, enter 'list songs'.")
      puts("To list all of the artists in your library, enter 'list artists'.")
      puts("To list all of the genres in your library, enter 'list genres'.")
      puts("To list all of the songs by a particular artist, enter 'list artist'.")
      puts("To list all of the songs of a particular genre, enter 'list genre'.")
      puts("To play a song, enter 'play song'.")
      puts("To quit, type 'exit'.")
      puts("What would you like to do?")
      command = gets.strip
      case command
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play_song"
        play_song
      else
        puts "That is not a valid option"
      end
    end
  end

  def list_songs
    name_array = Song.all.sort_by {|song| song.name}
    name_array.each_with_index do |song, index|
      real_index = index + 1
      puts "#{real_index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    name_array = Artist.all.sort_by {|artist| artist.name}
    name_array.each_with_index do |artist, index|
      real_index = index + 1
      puts "#{real_index}. #{artist.name}"
    end
  end

  def list_genres
    name_array = Genre.all.sort_by {|genre| genre.name}
    name_array.each_with_index do |genre, index|
      real_index = index + 1
      puts "#{real_index}. #{genre.name}"
    end
  end
end
