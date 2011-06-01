require 'sinatra/base'

class Rulu < Sinatra::Base
  dir = File.dirname(File.expand_path(__FILE__)) + '/..'

  set :views, "#{dir}/views"
  set :public, "#{dir}/public"
  set :static, true

  helpers do
    def speaker(start_time, end_time, speaker_name, speaker_link, talk)
      <<HTML
      <tr class="two_row">
        <th>
          #{start_time} - #{end_time}
        </th>
        <td>
          <p><a href="speakers##{speaker_link}">#{speaker_name}</a></p>
          <p>#{talk}</p>
        </td>
      </tr>
HTML
    end


    def break_helper
      <<HTML
      <tr class="one_row">
        <th></th>
        <td class="break">
          Break
        </td>
      </tr>
HTML
    end

    def current_tab(tab_info)
      tab, name = tab_info
      current = ""
      if request.path_info == tab
        current = "class='current'"
      end
      <<HTML
      <li>
	<a href="#{tab}" #{current} >
	  #{name}
	</a>
      </li>
HTML
    end
  end

  get '/' do
    show :index
  end

  # TODO Sinatra can't be DRYer than this?
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

  get '/legal' do
    show :legal
  end

  private
  def show(page, layout = true)
    erb page.to_sym, {:layout => layout}
  end
end
