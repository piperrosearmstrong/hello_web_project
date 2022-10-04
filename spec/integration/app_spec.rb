require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'testing GET /hello' do
    it 'returns 200 OK and contains an h1 title' do
      response = get('/hello')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Hello!</h1>')
    end
  end

  context 'testing POST /submit' do
    it 'returns 200 OK and correct content' do
      response = post('/submit', name: "Piper", message: "That sausage roll was delicious.")

      expect(response.status).to eq(200)
      expect(response.body).to eq('Thanks Piper, you returned this message: That sausage roll was delicious.')
    end
  end

  context 'testing GET /names' do
    it 'returns 200 OK and the correct content' do
      response = get('/names', names: "Julia, Mary, Karim")

      expect(response.status).to eq(200)
      expect(response.body).to eq('Julia, Mary, Karim')
    end
  end

  context "testing POST ./sortnames" do
    it 'returns 200 OK and correct content' do
      response = post('/sort_names?names=Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end
end