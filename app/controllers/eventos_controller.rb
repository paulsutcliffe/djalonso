class EventosController < InheritedResources::Base


  def show
    @evento = Evento.find(params[:id])
    @fotos = @evento.fotos.all
  end
end
