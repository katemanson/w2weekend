class Bar

  attr_accessor :stock, :takings

  def initialize()
    @stock = []
    @takings = 0
  end

  def set_up_drink_record(drink_name, price)
    @stock << Drink.new(name: drink_name, price: price)
  end

  def delivery(drink_name, quantity)
    for drink in @stock
      if drink.name == drink_name
        drink.number += quantity
      end
    end
  end
# ?Do this with enumerator and block?
  # if @stock.each { |drink| drink.name == drink_name }
  #   **drink**.stock += quantity  <-- ?access drink object in @stock array?
  # end

  def sale(drink_name, number_sold)
    for drink in @stock
      if drink.name == drink_name && drink.number >= number_sold
        @takings += drink.price * number_sold
        @takings = @takings.round(2)  
        # ?line above works to solve decimal > binary > decimal weirdness, but not too pretty, intuitive, readable? 
        drink.number -= number_sold
        drink.sales += number_sold
      else
        return "Sorry, no sale!"
      end
    end
  end

end