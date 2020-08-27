class PagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.new
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 20)
    end
  end

  def about
  end
end
