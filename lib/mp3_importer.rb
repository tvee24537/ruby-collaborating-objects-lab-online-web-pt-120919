class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files     #get a list of files in a directory
        files ||= Dir["#{@path}/*"].collect {|song| song.gsub("#{@path}/", "")}
    end

    def import
       files.each {|song| Song.new_by_filename(song)}
    end

end 