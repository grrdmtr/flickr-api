class FeedController < ApplicationController
  def index
    flickr = Flickr.new ENV['flickr_key'], ENV['flickr_secret']

    if params[:user_id]
      begin
        @photos = flickr.photos.search(:user_id => params[:user_id])
      rescue
        flash[:alert] = 'User not found'
        @photos = flickr.photos.getRecent(:api_key => ENV['flickr_key'], :per_page => 48)
      end
    else
      @photos = flickr.photos.getRecent(:api_key => ENV['flickr_key'], :per_page => 48)
    end
  end
end
