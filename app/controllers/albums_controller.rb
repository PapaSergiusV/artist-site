class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: %i[create edit change_priority]
  before_action :set_album, only: :update

  def create
    album = Album.new album_params
    if album.save
      render json: { id: album.id }, status: :ok
    else
      render json: album.errors, status: :unprocessable_entity
    end
  end

  def edit
    render component: 'pages/admin/album/Form', props: {
      csrf_token: form_authenticity_token,
      album: Album.find(params[:id])
    }, prerender: false
  end

  def update
    if @album.update album_params
      head :ok
    else
      render json: @album.errors, status: :unprocessable_entity
    end
  end

  def change_priority
    params[:priority].each_with_index do |id, i|
      Album.find(id).update priority: i
    end
    head :ok
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.permit(:id, :name, :description)
  end
end