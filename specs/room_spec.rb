require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../room' )
require_relative( '../song' )

class RoomTest < MiniTest::Test

  def setup
    @room = Room.new("Red Room")
    @song = Song.new("A Whiter Shade of Pale", "Procol Harum")
  end

  def test_room_has_name
    assert_equal("Red Room", @room.name)
  end

  def test_room_initially_has_empty_playlist
    assert_equal([], @room.playlist)
  end

  def test_room_is_initially_empty
    assert_equal([], @room.guestlist)
  end

end