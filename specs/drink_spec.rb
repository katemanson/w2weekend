require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../drink' )

class DrinkTest < MiniTest::Test

  def setup
    @drink = Drink.new(name: "Buckfast", price: 1.2)
  end

  def test_drink_has_name
    assert_equal("Buckfast", @drink.name)
  end

  def test_drink_has_price
    assert_equal(1.2, @drink.price)
  end

  def test_drink_initial_number_in_stock_is_zero
    assert_equal(0, @drink.number)
  end

  def test_drink_initial_number_sold_is_zero
    assert_equal(0, @drink.sales)
  end

end