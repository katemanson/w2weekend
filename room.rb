require_relative( './song' )
require_relative( './guest' )

class Room

  attr_reader :name, :capacity, :playlist, :guestlist, :entry_fees

  @@entry_fee = 10

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @playlist = []
    @guestlist = []
    @entry_fees = 0
  end

  def add_song(title, artist)
    @playlist << Song.new(title: title, artist: artist)
  end

  def check_in_guest(name, money)
    if @capacity > @guestlist.length && money >= @@entry_fee
      @guestlist << Guest.new(name: name, money: money)
      @guestlist[-1].money -= @@entry_fee
      @entry_fees += @@entry_fee
    else
      return "Sorry, no entry!"
    end
  end

  def check_out_guest(name)
    @guestlist.delete_if { |guest| guest.name == name }
  end
  # This for loop does the same thing:
  # def check_out_guest(name)
  #   for guest in @guestlist
  #     if guest.name == name
  #       @guestlist.delete(guest)
  #     end
  #   end
  # end

  def self.entry_fee
    return @@entry_fee
  end

end