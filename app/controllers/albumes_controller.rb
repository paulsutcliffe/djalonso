class AlbumesController < InheritedResources::Base

  def index
    @albumes = Album.all
    @megafolio_layout = 3
  end

  def show
    @album = Album.find(params[:id])
    @fotos = @album.fotos.all

    @megafolio_layout = 1
  end



end
