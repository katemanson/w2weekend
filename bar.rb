class Bar

  attr_reader :stock

  def initialize()
    @stock = []
  end

  def set_up_drink_record(drink_name, price)
    @stock << Drink.new(name: drink_name, price: price)
  end

  def delivery(drink_name, quantity)
    for drink in @stock
      if drink.name == drink_name
        drink.stock += quantity
      end
    end
  end
# How could this be done with enumerator and block?
  # if @stock.each { |drink| drink.name == drink_name }
  #   **drink**.stock += quantity
  # end

end