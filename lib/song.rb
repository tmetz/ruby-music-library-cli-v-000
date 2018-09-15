class Song

  @@all = []

  attr_accessor :name
  attr_reader :artist

  def initialize(name, *artist)
    @name=name
    self.artist=(artist[0])
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
    self.artist.add_song(self)
  end
end
