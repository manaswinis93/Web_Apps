require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }
  context "GET /albums" do
    it 'returns list of albums' do
      response = get('/albums')
      expect(response.status).to eq(200)
      expect(response.body).to include('<a href = "/albums/2">Surfer Rosa</a><br />')
      expect(response.body).to include('<a href = "/albums/7">Folklore</a><br />')
      expect(response.body).to include('<a href = "/albums/12">Ring Ring</a><br />')
    end
  end


  context "POST /albums" do
    it "should validate album parameters" do
      response = post('/albums', album_title: 'OK Computer', album_release_year: '1992', album_artist_id: '1')
      expect(response.status).to eq(400)
    end
    it 'returns 200 OK' do
      response = post('/albums', title: 'Voyage', release_year: '2022', artist_id: '2')

      expect(response.status).to eq(200)
      reload = get('/albums')
      expect((reload.body)).to include('Voyage')
    end
    it 'returns a confirmation view page' do
      response = post('/albums', title: 'Indigo', release_year: '2018', artist_id: 6)

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1> Your Album Indigo has been added! </h1>')
    end
  end
  context "GET /artists" do
    it 'returns list of artists and linking each artist to /artists/:id' do
      response = get('/artists')
  
      expect(response.status).to eq(200)
      expect(response.body).to include('<a href = "/artists/1">Pixies</a>')
      expect(response.body).to include('<a href = "/artists/4">Nina Simone</a>')
      expect(response.body).to include('<a href = "/artists/5">Kiasmos</a>')
    end
  end
  context "POST /artists" do
    it 'inserts a artist record into artists table' do
      response = post('/artists', name: 'Wild nothing', genre: 'Indie')

      expect(response.status).to eq(200)
      result = get('/artists')
      expect(result.body).to include('Wild nothing')
    end
    it 'returns a confirmation view page' do
      response = post('/artists', name: 'Test', genre: 'Indie')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1> Your Artist Test has been added! </h1>')
    end
  end
  context "GET /albums/:id" do
    it 'returns album record for ID: 2' do
      response = get('/albums/2')
      expect(response.status).to eq(200)
      expect(response.body).to include('Surfer Rosa')
      expect(response.body).to include('Release year: 1988')
      expect(response.body).to include('Artist: Pixies')
    end

    it 'returns album record for ID: 3' do
      response = get('/albums/3')
      expect(response.status).to eq(200)
      expect(response.body).to include('Waterloo')
      expect(response.body).to include('Release year: 1974')
      expect(response.body).to include('Artist: ABBA')
    end
  end
  context "GET /artists/:id" do
    it 'return artist info for that artist ID' do
      response = get('/artists/1')

      expect(response.status).to eq(200)
      expect(response.body).to include('Pixies')
      expect(response.body).to include('GENRE: Rock')
    end

    it 'return artist info for that artist ID' do
      response = get('/artists/4')

      expect(response.status).to eq(200)
      expect(response.body).to include('Nina Simone')
      expect(response.body).to include('GENRE: Pop')
    end
  end
  context'GET/albums/new' do
    it 'should return the form to add a new album' do
    response = get('/albums/new')
    expect(response.status).to eq(200)
    expect(response.body).to include('<form action = "/albums" method = "POST">')
    expect(response.body).to include('<input type = "text" name = "title"/>')
    expect(response.body).to include('<input type = "text" name = "release_year"/>')
    expect(response.body).to include('<input type = "number" name = "artist_id"/>')
    end
  end
  context'GET/artists/new' do
    it 'should return the form to add a new artist' do
    response = get('/artists/new')
    expect(response.status).to eq(200)
    expect(response.body).to include('<form action = "/artists" method = "POST">')
    expect(response.body).to include('<input type = "text" name = "name"/>')
    expect(response.body).to include('<input type = "text" name = "genre"/>')
    end
  end
end
