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

# ?DRY?
  def test_set_up_drink_record
    @bar.set_up_drink_record("Buckfast", 1.2)
    assert_equal(1, @bar.stock.length)
    assert_equal("Buckfast", @bar.stock[-1].name)
    assert_equal(1.2, @bar.stock[-1].price)
    assert_equal(0, @bar.stock[-1].number)
    assert_equal(0, @bar.stock[-1].sales)
    @bar.set_up_drink_record("Babycham", 1.5)
    assert_equal(2, @bar.stock.length)
    assert_equal("Babycham", @bar.stock[-1].name)
    assert_equal(1.5, @bar.stock[-1].price)
    assert_equal(0, @bar.stock[-1].number)
    assert_equal(0, @bar.stock[-1].sales)
  end

  def test_drink_delivery
    @bar.set_up_drink_record("Buckfast", 1.2)
    @bar.delivery("Buckfast", 100)
    assert_equal(100, @bar.stock[-1].number)
  end

  def test_drink_sale__drink_available
    @bar.set_up_drink_record("Buckfast", 1.2)
    @bar.delivery("Buckfast", 100)
    @bar.sale("Buckfast", 3)
    assert_equal(3.6, @bar.takings)
    assert_equal(97, @bar.stock[-1].number)
    assert_equal(3, @bar.stock[-1].sales)
  end

  # This test about decimal > binary > decimal rounding problem.
  def test_drink_sale__shows_no_rounding_effect
    @bar.set_up_drink_record("Buckfast", 1.2)
    @bar.delivery("Buckfast", 1000000000)
    @bar.sale("Buckfast", 1000000000)
    assert_equal(1200000000, @bar.takings)
    assert_equal(0, @bar.stock[-1].number)
    assert_equal(1000000000, @bar.stock[-1].sales)
  end

  def test_drink_sale__drink_not_available
    @bar.set_up_drink_record("Buckfast", 1.2)
    assert_equal("Sorry, no sale!", @bar.sale("Buckfast", 3))
    assert_equal(0, @bar.takings)
    assert_equal(0, @bar.stock[-1].number)
    assert_equal(0, @bar.stock[-1].sales)
  end

end