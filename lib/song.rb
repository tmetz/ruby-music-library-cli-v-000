class Song

  @@all = []

  attr_accessor :name
  attr_writer :artist

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key=}"), value)}
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

  def artist=
    self.artist.add_song(self)
  end
end
