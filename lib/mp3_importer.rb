class MP3Importer
    attr_accessor :path
  
    def initialize(path)
      @path = path
    end
  
    def files
      files = []
      Dir.new(self.path).each do |file|
        files << file if file.length > 4
      end
      files
    end
  
    def import
      self.files.each do |filename|
        Song.new_by_filename(filename)
      end
    end
  end

#   MP3Importer
#   #initialize
#     accepts a file path to parse mp3 files from
#   #files
#     loads all the mp3 files in the path directory
#     normalizes the filename to just the mp3 filename with no path
#   #import
#     imports the files into the library by creating songs from a filename