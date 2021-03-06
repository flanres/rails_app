require 'rubygems'
require 'google/api_client'
require 'optimist'

module StaticPagesHelper

  DEVELOPER_KEY = Settings.api_key
  YOUTUBE_API_SERVICE_NAME = Settings.api_name
  YOUTUBE_API_VERSION = Settings.api_ver

  def get_service
    client = Google::APIClient.new(
      key: DEVELOPER_KEY,
      authorization: nil,
      application_name: $PROGRAM_NAME,
      application_version: Settings.app_ver
    )
    youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

    return client, youtube
  end

  def get_data(keyword)
    arg_array_save = []
    arg_array_save = ARGV.shift(4)

    if keyword == "recent"
      opts = Optimist::options do
        opt :Srch, 'Search term', :type => String, :default => keyword
        opt :max_results, 'Max results', :type => :int, :default => Settings.lines_per_page
        opt :order, 'order', :type => String, :default => 'date'
        opt :regionCode, 'region', :type => String, :default => 'JP'
      end
    
    else
      opts = Optimist::options do
        opt :Srch, 'Search term', :type => String, :default => keyword
        opt :max_results, 'Max results', :type => :int, :default => Settings.lines_per_page
        opt :order, 'order', :type => String, :default => 'date'
        opt :regionCode, 'region', :type => String, :default => 'JP'
      end
    end

    arg_array_save.each do |arg_push|
      ARGV.push(arg_push)
    end

    client, youtube = get_service

    begin

      search_response = client.execute!(
        :api_method => youtube.search.list,
        :parameters => {
          :part => 'snippet',
          :q => opts[:Srch],
          :maxResults => opts[:max_results],
          :order => opts[:order],
          :regionCode => opts[:regionCode]
        }
      )
      videos = search_response.data.items
      videos.each_with_index do |input_db_val|
        # DB内に取得動画情報のURLと同じURLが存在しない時にDB登録を行う
        if Video.find_by(url: Settings.jump_url.to_s + input_db_val["id"]["videoId"].to_s).blank?
          Video.create!(title: input_db_val["snippet"]["title"],
                        description: input_db_val["snippet"]["description"],
                        url: Settings.jump_url.to_s + input_db_val["id"]["videoId"].to_s,
                        thumbnail_img: input_db_val["snippet"]["thumbnails"]["default"]["url"])
        end
      end
    rescue Google::APIClient::TransmissionError => e
      puts e.result.body
    end
  end

end
