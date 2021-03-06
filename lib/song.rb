require 'pry'
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
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song_by_name = self.create
    song_by_name.name = name
    song_by_name
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    Song.all.find do |i|
      i.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    array = file.split(/[-.]/).collect(&:strip)
    song = self.find_or_create_by_name(array[1])
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song
  end

  def self.destroy_all
    @@all = []
  end
end
