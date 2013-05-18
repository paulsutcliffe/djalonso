class AlbumesController < InheritedResources::Base



  def show
    @album = Album.find(params[:id])
    @fotos = @album.fotos.all
  end



end
