require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../room' )

class RoomTest < MiniTest::Test

  def setup
    @room = Room.new("Red Room", 12)
  end

  def test_room_has_name
    assert_equal("Red Room", @room.name)
  end

  def test_room_has_capacity
    assert_equal(12, @room.capacity)
  end

  def test_room_initially_has_empty_playlist
    assert_equal(0, @room.playlist.length)
  end

  def test_room_is_initially_empty
    assert_equal(0, @room.guestlist.length)
  end

  def test_room_initially_has_zero_money_from_entry_fees
    assert_equal(0, @room.total_entry_fees)
  end

  # ?DRY?
  def test_add_songs_to_playlist
    @room.add_song("A Whiter Shade of Pale", "Procol Harum")
    assert_equal(1, @room.playlist.length)
    assert_equal("A Whiter Shade of Pale", @room.playlist[-1].title)
    assert_equal("Procol Harum", @room.playlist[-1].artist)
    @room.add_song("Itchycoo Park", "Small Faces")
    assert_equal(2, @room.playlist.length)
    assert_equal("Itchycoo Park", @room.playlist[-1].title)
    assert_equal("Small Faces", @room.playlist[-1].artist)
  end

  def test_guest_is_checked_in_and_has_paid_entry_fee
    @room.check_in_guest("Dirk", 50, "Boris the Spider")
    assert_equal(1, @room.guestlist.length)
    assert_equal("Dirk", @room.guestlist[-1].name)
    assert_equal(40, @room.guestlist[-1].money)
    assert_equal(10, @room.total_entry_fees)
  end

  def test_guest_is_checked_out
    @room.check_in_guest("Dirk", 50, "Boris the Spider")
    @room.check_in_guest("Trevor", 20, "Toxic")
    assert_equal(2, @room.guestlist.length)
    assert_equal(20, @room.total_entry_fees)
    @room.check_out_guest("Dirk")
    assert_equal(1, @room.guestlist.length)
    assert_equal("Trevor", @room.guestlist[-1].name)
  end

  # ?test okay?
  def test_twelve_guests_can_check_in_but_not_thirteenth
    12.times do
      @room.check_in_guest("Dummy Guest", 10, "Dummy Song")
    end
    assert_equal("Sorry, no entry!", @room.check_in_guest("Petronella", 10, "Fever"))
    assert_equal(12, @room.guestlist.length)
  end

  def test_entry_fee_is_10
    assert_equal(10, Room.entry_fee)
  end

  def test_guest_cannot_check_in_without_entry_fee
    assert_equal("Sorry, no entry!", @room.check_in_guest("Joe", 8, "Loser"))
  end

  def test_keep_track_of_entry_fees
    3.times do
      @room.check_in_guest("Dummy Guest", 10, "Dummy Song")
    end
    assert_equal(30, @room.total_entry_fees)
  end

  def test_favourite_song_on_playlist
    @room.add_song("Boris the Spider", "The Who")
    assert_equal("Woohoo!", @room.check_in_guest("Dirk", 50, "Boris the Spider"))
  end

end