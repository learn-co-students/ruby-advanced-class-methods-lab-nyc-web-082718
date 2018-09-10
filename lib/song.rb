class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    # binding.pry
    s = Song.new
    # @@all << s
    s.save
    s
  end

  def self.new_by_name(name)
    s = Song.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = Song.create
    s.name = name
    s
  end

  def self.find_by_name(name)
    @@all.find { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    s = self.find_by_name(name)
    if !s
      create_by_name(name)
    else
      s
    end
  end

  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    name = arr[1].split(".mp3")[0]
    artist_name = arr[0]
    s = new_by_name(name)
    s.artist_name = artist_name
    s
  end

  def self.create_from_filename(filename)
    s = self.new_from_filename(filename)
    s.save
    s
  end

  def self.destroy_all
    @@all = []
  end

end
