require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../song' )

class SongTest < MiniTest::Test

  def setup
    @song = Song.new(title: "A Whiter Shade of Pale", artist: "Procol Harum")
  end

  def test_song_has_title
    assert_equal("A Whiter Shade of Pale", @song.title)
  end

  def test_song_has_artist
    assert_equal("Procol Harum", @song.artist)
  end

end