class StaticPagesController < ApplicationController
  include StaticPagesHelper
  def home
    if Video.blank?
      @videos = Video.new
    end
    get_data("Francisco Bustamante")
    get_data("Mosconi Cup")
    @videos = Video.all
  end

  def recommend
  end

  def popular
  end

end

