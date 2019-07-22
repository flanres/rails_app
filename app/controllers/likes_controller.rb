class LikesController < ApplicationController
  before_action :logged_in_user
  def create
    byebug
    @video = Video.find(params[:video_id])
    unless @video.good?(current_user)
      @video.good(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
#    @video = Video.find(params[:video_id])
#    @video.good(current_user)
  end

  def destroy
    byebug
    @video = Like.find(params[:id]).video
    if @video.good?(current_user)
      @video.not_bad(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
#    @video = Like.find(params[:id]).video
#    @video.not_bad(current_user)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end


end
