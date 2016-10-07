require_relative( './song' )
require_relative( './guest' )

class Room

  attr_reader :name, :playlist, :guestlist

  def initialize(name)
    @name = name
    @playlist = []
    @guestlist = []
  end

  def add_song(title, artist)
    @playlist << Song.new(title: title, artist: artist)
  end

  def check_in_guest(name)
    @guestlist << Guest.new(name)
  end

  def check_out_guest(name)
    for guest in @guestlist
      if guest.name == name
        @guestlist.delete(guest)
      end
    end
  end
  # do this with a block? 
  # { [name] name == @guestlist.name }

end