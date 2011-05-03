require 'sinatra/base'

class Rulu < Sinatra::Base
  dir = File.dirname(File.expand_path(__FILE__)) + '/..'

  set :views, "#{dir}/views"
  set :public, "#{dir}/public"
  set :static, true

  helpers do
    def speaker(time, name, link, talk)
      <<HTML
      <tr class="two_row">
        <th>
          #{time}
        </th>
        <td>
          <a href="/speakers##{link}">#{name}</a>
          <br>
          #{talk}
        </td>
      </tr>
HTML
    end


    def break_helper(time)
      <<HTML
      <tr class="one_row">
        <th>
          #{time}
        </th>
        <td class="break">
          Break
        </td>
      </tr>
HTML
    end
  end

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

  get '/sponsoring' do
    show :sponsoring
  end

  private
  def show(page, layout = true)
    erb page.to_sym, {:layout => layout}
  end
end
