class Guest

attr_reader :name, :money

  def initialize(params)
    @name = params[:name]
    @money = params[:money]
  end

end