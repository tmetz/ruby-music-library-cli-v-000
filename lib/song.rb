class Song

  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name=name
    if artist
      self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    if found_song
      found_song
    else
      self.create(name)
    end
  end

  def self.find_by_name(which_song)
    @@all.find {|song| song.name == which_song}
  end

  def self.new_from_filename(filename)
    song = self.new
    parse_info = filename.chomp(".mp3").split(" - ")
    song.artist = Artist.find_or_create_by_name(parse_info[0])
    song.name = parse_info[1]
    song.genre = Genre.find_or_create_by_name(parse_info[2])
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new
    parse_info = filename.chomp(".mp3").split(" - ")
    song.artist_name = parse_info[0]
    song.name = parse_info[1]
    @@all << song
    song
  end
end
