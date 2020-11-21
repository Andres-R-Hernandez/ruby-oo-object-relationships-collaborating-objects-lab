class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path=path
  end

  def files
    @song_array = Dir.children(self.path)
  end

  def import
    self.files.each{|song|Song.new_by_filename(song)}
  end

end
