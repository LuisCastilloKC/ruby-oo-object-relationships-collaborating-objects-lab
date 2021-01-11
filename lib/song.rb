class Song
    attr_accessor :artist, :name
  
    @@all = []

    def initialize(name)
        @name = name
        save()
    end

    def save
        @@all << self 
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song = self.new(filename.split(" - ")[1])
        artist = filename.split(" - ")[0]
        artist = Artist.new(artist)
        song.artist = artist
        song
    end

    
    def artist_name=(artist)
        artist = Artist.find_or_create_by_name(artist)
        self.artist = artist
    end 
end

# Song
#   #initialize with a name
#     accepts a name for the song and makes it accessible through an attribute accessor
#   #name=
#     sets the song name
#   #artist=
#     sets the artist object to belong to the song
#   .all
#     returns all existing Song instances
#   .new_by_filename
#     creates a new instance of a song from the file that's passed
#     associates new song instance with the artist from the filename
#   #artist_name=
#     accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute