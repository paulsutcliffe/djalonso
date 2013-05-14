class MusicasController < InheritedResources::Base

  def create
    create!{musicas_path}
  end
  def update
    update!{musicas_path}
  end
  def destroy
    destroy!{musicas_path}
  end
end
