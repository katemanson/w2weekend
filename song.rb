class Song

  attr_reader :title, :artist

  def initialize(params)
    @title = params[:title]
    @artist = params[:artist]
  end

end