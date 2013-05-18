class FotosController < InheritedResources::Base

  before_filter :find_album, :except => ['index']

  def new
    @foto = @album.fotos.new
  end

  def create
    # @foto = Foto.create(params[:foto])
    @foto = @album.fotos.build(params[:foto])

    if @foto.save
      redirect_to album_path(@album)
    else
      render :new
    end
  end


  def find_album
   # provisionalmente dejé el mismo nombre de variable para evitar estar cambiando mucho el código

   # @album = Album.find(params[:album_id])
    @album = Evento.find(params[:evento_id])
  end
end
