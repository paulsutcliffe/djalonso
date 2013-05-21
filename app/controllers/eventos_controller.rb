class EventosController < InheritedResources::Base

  def index
    @eventos = Evento.all
    @megafolio_layout = 3
  end


  def show
    @evento = Evento.find(params[:id])
    @fotos = @evento.fotos.all

    @megafolio_layout = 1
  end
end
