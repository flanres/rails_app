class StaticPagesController < ApplicationController
  include StaticPagesHelper
  def home
#    Video.delete_all
#    @video = Video.new
    get_data("PooL Live VS")
    get_data("World Cup Of Pool 2019")
    @videos = Video.all
  end

  def recommend
  end

  def popular
  end

end

