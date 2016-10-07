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

  def test_add_song_to_playlist
    @room.add_song("A Whiter Shade of Pale", "Procol Harum")
    assert_equal(1, @room.playlist.length)
    assert_equal("A Whiter Shade of Pale", @room.playlist[-1].title)
    assert_equal("Procol Harum", @room.playlist[-1].artist)
  end

  def test_guest_is_checked_in_and_has_paid_entry_fee
    @room.check_in_guest("Dirk", 50)
    assert_equal(1, @room.guestlist.length)
    assert_equal("Dirk", @room.guestlist[-1].name)
    assert_equal(40, @room.guestlist[-1].money)
  end

  def test_guest_is_checked_out
    @room.check_in_guest("Dirk", 50)
    @room.check_in_guest("Trevor", 20)
    assert_equal(2, @room.guestlist.length)
    @room.check_out_guest("Dirk")
    assert_equal(1, @room.guestlist.length)
    assert_equal("Trevor", @room.guestlist[-1].name)
  end

  # ?test okay?
  def test_twelve_guests_can_check_in_but_not_thirteenth
    12.times do
      @room.check_in_guest("Dummy Guest", 10)
    end
    assert_equal("Sorry, no entry!", @room.check_in_guest("Petronella", 10))
    assert_equal(12, @room.guestlist.length)
  end

  def test_entry_fee_is_10
    assert_equal(10, Room.entry_fee)
  end

  def test_guest_cannot_check_in_without_enough_money_for_entry
    assert_equal("Sorry, no entry!", @room.check_in_guest("Joe", 8))
  end

end