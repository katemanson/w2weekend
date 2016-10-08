require_relative( './song' )
require_relative( './guest' )

class Room

  attr_reader :name, :capacity, :playlist, :guestlist, :total_entry_fees, :bar_takings

  @@entry_fee = 10

  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @playlist = []
    @guestlist = []
    @total_entry_fees = 0
    @bar_takings = 0
  end

  def add_song(title, artist)
    @playlist << Song.new(title: title, artist: artist)
  end

  def check_in_guest(name, money, favourite_song)
    if @capacity > @guestlist.length && money >= @@entry_fee
      @guestlist << Guest.new(name: name, money: money, favourite_song: favourite_song)
      pay_entry_fee
      favourite_song_on_playlist
    else
      return "Sorry, no entry!"
    end
  end

  def pay_entry_fee
    @guestlist[-1].money -= @@entry_fee
    @total_entry_fees += @@entry_fee
  end

  def favourite_song_on_playlist
    favourite = @guestlist[-1].favourite_song
    if @playlist.each { |song| song.title == favourite }
      return "Woohoo!"
    end
  end
# This for loop does the same thing:
  # for song in @playlist
  #   if song.title == @guestlist[-1].favourite_song
  #     return "Woohoo!"
  #   end
  # end

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

  def bar_sale(drink_name)


end