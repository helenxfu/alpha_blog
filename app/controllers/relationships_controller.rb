class RelationshipsController < ApplicationController
  before_action :require_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js { redirect_back(fallback_location: root_url) }
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js { redirect_back(fallback_location: root_url) }
    end
  end
end
