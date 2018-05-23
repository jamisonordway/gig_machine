class Admin::ArtistsController <Admin::BaseController

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end
end
