class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
  end

  def self.create(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
    self.new(name, artist_name).save
  end

  def self.new_by_name(name)
    s = self.new(name)
  end

  def self.create_by_name(name)
    s = self.create(name)
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) != nil ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort { |song1, song2| song1.name <=> song2.name }
  end

  def self.new_from_filename(f)
    name = f.split(" - ")[1].split(".mp3")[0]
    artist_name = f.split(" - ")[0]
    s = self.new(name, artist_name)
  end

  def self.create_from_filename(f)
    name = f.split(" - ")[1].split(".mp3")[0]
    artist_name = f.split(" - ")[0]
    self.create(name, artist_name)
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

end
