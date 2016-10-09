class Drink

  attr_reader :name, :price
  attr_accessor :number, :sales

  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @number = 0
    @sales = 0
  end

end