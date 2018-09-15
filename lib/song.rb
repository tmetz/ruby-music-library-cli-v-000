class Song

  @@all = []

  attr_accessor :name
  attr_reader :artist

  def initialize(name, artist=nil)
    @name=name
    self.artist=(artist)
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
end
