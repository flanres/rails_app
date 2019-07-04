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

  def get_data
    arg_array_save = []
    arg_array_save = ARGV.shift(4)
    opts = Optimist::options do
      opt :Srch, 'Search term', :type => String, :default => "Bustamante pool"
      opt :max_results, 'Max results', :type => :int, :default => 5
      opt :order, 'order', :type => String, :default => 'date'
      opt :regionCode, 'region', :type => String, :default => 'JP'
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
#      for video_index in 0..videos.length - 1 do
#          Video.create!(title: videos[video_index]["snippet"]["title"],
#                        description: videos[video_index]["snippet"]["description"],
#                        url: Settings.jump_url + videos[video_index]["id"]["videoId"],
#                        thumbnail_img: videos[video_index]["snippet"]["thumbnails"]["default"]["url"])
#      end
      videos.each_with_index do |input_db_val| 
          Video.create!(title: input_db_val["snippet"]["title"],
                        description: input_db_val["snippet"]["description"],
                        url: Settings.jump_url + input_db_val["id"]["videoId"],
                        thumbnail_img: input_db_val["snippet"]["thumbnails"]["default"]["url"])
      end
    rescue Google::APIClient::TransmissionError => e
      puts e.result.body
    end
  end

end
