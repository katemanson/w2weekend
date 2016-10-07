class Room

  attr_reader :name, :playlist, :guestlist

  def initialize(name)
    @name = name
    @playlist = []
    @guestlist = []
  end

end