class Guest

  attr_accessor :name, :money, :favourite_song

  def initialize(params)
    @name = params[:name]
    @money = params[:money]
    @favourite_song = params[:favourite_song]
  end

end