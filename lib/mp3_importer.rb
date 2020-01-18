class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files     #get a list of files in a directory
    files ||= Dir["#{@path}/*"].collect {|song| song.gsub("#{@path}/", "")}
  end

  def import      #send us to the Song class, specifically Song.new_by_filename and handle the creation of Song instances and their associated Artist instances.
   files.each {|song| Song.new_by_filename(song)}
  end

end 