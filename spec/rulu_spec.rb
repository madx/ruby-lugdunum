require File.join(File.dirname(__FILE__), '..', 'lib', 'rulu')
require 'rspec'
require 'rack/test'

Rulu.set :environment, :test

describe Rulu do
  include Rack::Test::Methods

  def app
    Rulu
  end

  it 'should respond to /' do
    get '/'
    last_response.should be_ok
  end

  it 'should respond to /schedule' do
    get '/schedule'
    last_response.should be_ok
  end

  it 'should respond to /speakers' do
    get '/speakers'
    last_response.should be_ok
  end

  it 'should respond to /venue' do
    get '/venue'
    last_response.should be_ok
  end

  it 'should respond to /sponsoring' do
    get '/sponsoring'
    last_response.should be_ok
  end

  it 'should respond to /sponsors' do
    get '/sponsors'
    last_response.should be_ok
  end

  it 'should respond to /legal' do
    get '/legal'
    last_response.should be_ok
  end

  it 'should respond to /party' do
    get '/party'
    last_response.should be_ok
  end
end
