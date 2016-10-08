class Drink

  attr_reader :name, :price
  attr_accessor :stock, :sales

  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @stock = 0
    @sales = 0
  end

  # def delivery(number)
  #   @stock += number
  # end

end