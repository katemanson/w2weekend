class Guest

  attr_accessor :name, :money

  def initialize(params)
    @name = params[:name]
    @money = params[:money]
  end

end