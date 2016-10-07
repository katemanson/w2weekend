require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../room' )

class RoomTest < MiniTest::Test

  def setup
    @room = Room.new("Red Room")
  end

  def test_room_has_name
    assert_equal("Red Room", @room.name)
  end

  def test_room_initially_has_empty_playlist
    assert_equal(0, @room.playlist.length)
  end

  def test_room_is_initially_empty
    assert_equal(0, @room.guestlist.length)
  end

  def test_add_song_to_playlist
    @room.add_song("A Whiter Shade of Pale", "Procol Harum")
    assert_equal(1, @room.playlist.length)
    assert_equal("A Whiter Shade of Pale", @room.playlist[-1].title)
    assert_equal("Procol Harum", @room.playlist[-1].artist)
  end

  def test_guest_is_checked_in
    @room.check_in_guest("Dirk McGangle")
    assert_equal(1, @room.guestlist.length)
    assert_equal("Dirk McGangle", @room.guestlist[-1].name)
  end

  def test_guest_is_checked_out
    @room.check_in_guest("Dirk McGangle")
    @room.check_in_guest("Hairy Maclary")
    @room.check_out_guest("Dirk McGangle")
    assert_equal(1, @room.guestlist.length)
    assert_equal("Hairy Maclary", @room.guestlist[-1].name)
  end

end