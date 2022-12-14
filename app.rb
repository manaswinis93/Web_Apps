# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  get '/albums/new' do
    return erb(:new_album)
  end
  get '/albums' do
    repo = AlbumRepository.new
    @albums = repo.all 
    return erb(:get_albums)
  end
  get '/albums/:id' do
    repo = AlbumRepository.new
    result = ArtistRepository.new
    @album = repo.find(params[:id])
    @artist = result.find(@album.artist_id)
    return erb(:get_album_id)
  end
  post '/albums' do
    if invalid_request_parameters?
      status 400
      return ''
   end
   album = Album.new
   album.title = params[:title]
   album.release_year = params[:release_year]
   album.artist_id = params[:artist_id]
   repo = AlbumRepository.new
   repo.create(album)
    @title = album.title
   return erb(:album_added)
  end

  def invalid_request_parameters?
   return ( params[:title] == nil || params[:release_year] == nil || params[:artist_id] == nil )
  end

  get '/artists/new' do
    return erb(:new_artist)
  end
  get '/artists' do
    repo = ArtistRepository.new
    @artists = repo.all
    return erb(:get_artists)
  end
  post '/artists' do
    artist = Artist.new
    artist.name = params[:name]
    artist.genre = params[:genre]
    repo = ArtistRepository.new
    repo.create(artist)
    @name = artist.name
    return erb(:artist_added)
  end
  
  get '/artists/:id' do
    repo = ArtistRepository.new
    @artist = repo.find(params[:id])
    return erb(:get_artist_id)
  end
  get '/' do
    return erb(:homepage)
  end
end