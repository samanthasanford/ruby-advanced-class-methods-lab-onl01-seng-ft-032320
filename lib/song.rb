class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def create(song)
    song = self.create 

  end


  def save
    self.class.all << self
  end

end
