require 'CSV'

class Curator
  attr_reader :artists,
              :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo)
    # @photographs ||= Photograph.new(photo)
    @photographs << Photograph.new(photo)
    photo
  end

  def add_artist(artist)
    @artists << Artist.new(artist)
    artist
  end

  def find_artist_by_id(id_number)
    @artists.find do |artist|
      artist.id == id_number
    end
  end

  def find_photograph_by_id(id_number)
    @photographs.find do |photograph|
      photograph.id == id_number
    end
  end

  def find_photographs_by_artist(artist)
    @artists.find_all do |artist|
      artist.name == artist
    end
  end
end
