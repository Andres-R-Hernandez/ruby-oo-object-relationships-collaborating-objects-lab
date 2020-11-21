class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name=name
    self.save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.new_by_filename(filename)
    split_song = filename.split(' - ')
    song_inst = self.new(split_song[1])
    song_inst.artist_name = split_song[0]
    song_inst
  end

  def artist_name=(name)
    Artist.find_or_create_by_name(name).add_song(self)
  end

end
