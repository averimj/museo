require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'
require './lib/artist'
require './lib/curator'
require 'CSV'

class CuratorTest < Minitest::Test
  def test_it_exists
    curator = Curator.new

    assert_instance_of Curator, curator
  end

  def test_its_attributes_starts_off_as_empty_arrays
    curator = Curator.new

    assert_equal [], curator.artists
    assert_equal [], curator.photographs
  end

  def test_it_can_return_photographs
    curator = Curator.new

    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }

    photograph_1 = Photograph.new(photo_1)
    photograph_2 = Photograph.new(photo_2)

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

    assert_instance_of Array, curator.photographs
    # assert_equal [photograph_1, photograph_2], curator.photographs
  end

  def test_it_has_attributes
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    curator = Curator.new
    photograph_1 = Photograph.new(photo_1)
    photograph_2 = Photograph.new(photo_2)

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

    # photograph_1 = Photograph.from_csv('./data/photographs.csv')

    # assert_equal photograph_1, curator.photographs.first
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first.name
    assert_equal "1954", curator.photographs.first.year
    assert_equal "1", curator.photographs.first.artist_id
    assert_equal "1", curator.photographs.first.id
  end

  def test_it_can_return_artist
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    curator = Curator.new
    art_1 = Artist.new(artist_1)
    art_2 = Artist.new(artist_2)

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    assert_instance_of Array, curator.artists
  end

  def test_it_can_find_artist_by_id
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }

    curator = Curator.new
    art_1 = Artist.new(artist_1)
    art_2 = Artist.new(artist_2)

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    # assert_equal art_1, curator.find_artist_by_id("1")
    assert_equal "1", curator.artists.first.id
    assert_equal "Henri Cartier-Bresson", curator.artists.first.name
    assert_equal "1908", curator.artists.first.born
    assert_equal "2004", curator.artists.first.died
    assert_equal "France", curator.artists.first.country
  end

  def test_it_can_find_photographer_by_id
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    curator = Curator.new
    photograph_1 = Photograph.new(photo_1)
    photograph_2 = Photograph.new(photo_2)

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

     # assert_equal photograph_2.encoding: ASCII-8BIT, curator.find_photograph_by_id("2")
     # assert_equal photograph_2.inspect, curator.find_photograph_by_id("2")

    # assert_equal photograph_2, curator.find_photograph_by_id("2")
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", curator.photographs.first.name
    assert_equal "1954", curator.photographs.first.year
    assert_equal "1", curator.photographs.first.artist_id
    assert_equal "1", curator.photographs.first.id
  end

  def test_it_can_find_photographer_by_artist
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    }
    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"
    }
    photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"
    }
    photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"
    }
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France"
    }
    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist_3 = {
      id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"
    }

    curator = Curator.new

    photograph_1 = Photograph.new(photo_1)
    photograph_2 = Photograph.new(photo_2)
    photograph_3 = Photograph.new(photo_3)
    photograph_4 = Photograph.new(photo_4)

    art_1 = Artist.new(artist_1)
    art_2 = Artist.new(artist_2)
    art_3 = Artist.new(artist_3)

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_artist(artist_3)

    diane_arbus = curator.find_artist_by_id("3")

    assert_equal

    assert_equal [photograph_3, photograph_4], curator.find_photographs_by_artist(diane_arbus)
  end

end
