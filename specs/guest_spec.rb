require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../guest' )

class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new(name: "Dirk", money: 50, favourite_song: "Boris the Spider")
  end

  def test_guest_has_name
    assert_equal("Dirk", @guest.name)
  end

  def test_guest_has_money
    assert_equal(50, @guest.money)
  end

  def test_guest_has_favourite_song
    assert_equal("Boris the Spider", @guest.favourite_song)
  end
  
end