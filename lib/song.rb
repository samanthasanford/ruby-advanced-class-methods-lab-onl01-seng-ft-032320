class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    @name = self.new
    @name.save
    @name
  end

  def self.new_by_name(name)
    @name = self.new
    @name.name = name
    @name
  end

  def self.create_by_name(name)
    @name = self.new
    @name.name = name
    @name.save
    @name
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|i| i.name}
  end

  def self.new_from_filename(data)
    rows = data.split(/ - |.mp3/)
    name = rows[1]
    artist_name = rows[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(data)
    @@all << self.new_from_filename(data)
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
