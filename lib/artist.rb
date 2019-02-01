class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name=name
    @songs = []
  end

   def add_song(song)
     song.artist = self unless song.artist == self
     @songs << song unless @songs.include?(song)
   end

  def self.all
    @@all
  end

  def songs
  @songs
  end

def genres
  @songs.collect{|song| song.genre}.uniq
end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
end