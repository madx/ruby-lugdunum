require 'sinatra/base'

class Rulu < Sinatra::Base
  dir = File.dirname(File.expand_path(__FILE__)) + '/..'
  
  set :views, "#{dir}/views"
  set :public, "#{dir}/public"
  set :static, true
  
  get '/' do
    show :index
  end
  
  get '/schedule' do
    show :schedule
  end
  
  get '/speakers' do
    show :speakers
  end
  
  get '/venue' do
    show :venue
  end
  
  private
  def show(page, layout = true)
    erb page.to_sym, {:layout => layout}
  end
end
