class Artist

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)  
    @songs << song
  end

  def songs   #get all existing Song instances from Song and select only the ones that are associated with this Artist instance.
    Song.all.each do |song|
      if song.artist == self
        @songs << song
      end
    end
    @songs
  end

  def self.find_or_create_by_name(name)   #Find the artist instance that has that name or create one if it doesn't exist.
    self.all.detect {|artist| artist.name == name} || self.new(name)
  end

  def print_songs  #outputs the names of all songs associated with this Artist instance.
    @songs.each do |song|
      puts song.name 
    end    
  end

end 