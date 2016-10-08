require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../bar' )
require_relative( '../drink' )

class BarTest < MiniTest::Test

  def setup
    @bar = Bar.new()
  end

  def test_bar_initially_has_no_stock
    assert_equal(0, @bar.stock.length)
  end

  def test_set_up_drink_record
    @bar.set_up_drink_record("Buckfast", 1.20)
    assert_equal(1, @bar.stock.length)
    assert_equal("Buckfast", @bar.stock[-1].name)
    assert_equal(1.20, @bar.stock[-1].price)
    assert_equal(0, @bar.stock[-1].stock)
    assert_equal(0, @bar.stock[-1].sales)
  end

  def test_drink_delivery
    @bar.set_up_drink_record("Buckfast", 1.20)
    @bar.delivery("Buckfast", 100)
    assert_equal(100, @bar.stock[-1].stock)
  end

end