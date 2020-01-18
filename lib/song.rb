class Song 
  
  attr_accessor :name, :artist 
  
  def initialize(name)
    @name = name
    
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(file)
    song_name = file.chomp(".mp3").split(" - ")
    song = Song.new(song_name[1])
    song.artist_name = song_name[0]
    song
  end
  
  def self.all
    @@all
  end  
end

class Artist
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.all 
    @all
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def add_song(song)
    @songs << song 
  end
  
  def self.find(name)
    self.all.detect {|artist| artist.name == name}
  end
    
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
    end
  end
  
  def print_songs #print out songs in @songs
    self.songs.each {|song| song.name}
  end  
  
end