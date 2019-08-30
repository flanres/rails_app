class StaticPagesController < ApplicationController
  include StaticPagesHelper
  def home
    if Video.blank?
      @videos = Video.new
    end
    get_data("【PooL Live】 VS")
    get_data("Bustamante")
    @videos = Video.all
  end

  def recommend
  end

  def popular
  end

end

