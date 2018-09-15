class Artist

  @@all = []

  attr_accessor :name
  attr_writer :songs

  def initialize(name)
    @name = name
    @songs = []
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
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def add_song(song)
    if !exists?(song.artist)
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end
end
