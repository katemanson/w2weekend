require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../guest' )

class GuestTest < MiniTest::Test

  def setup
    @guest = Guest.new("Dirk McGangle")
  end

  def test_guest_has_name
    assert_equal("Dirk McGangle", @guest.name)
  end

end