class Artist
    attr_accessor :name

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

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def print_songs
        Song.all.each do |song| 
            if song.artist == self 
                puts song.name
            end
        end
    end

    def self.find_or_create_by_name(name)
        
        x = self.all.find do |artist|
            if artist.name == name
                artist
            end
        end
        x ? x : self.new(name)
    end
end


# Artist
#   #initialize with #name
#     accepts a name for the artist
#   #name=
#     sets the artist name
#   .all
#     returns all existing Artist instances
#   #songs
#     lists all songs that belong to this artist
#   #add_song
#     keeps track of an artist's songs
#   .find_or_create_by_name
#     always returns an Artist instance
#     finds or creates an artist by name maintaining uniqueness of objects by name property
#     Creates new instance of Artist if none exist
#   #print_songs
#     lists all of the artist's songs