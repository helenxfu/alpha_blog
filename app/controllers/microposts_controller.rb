class MicropostsController < ApplicationController
  before_action :set_micropost, only: [:destroy]
  before_action :require_user, only: [:create, :destroy]
  before_action :require_permitted_user, only: [:create, :destroy]

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_back(fallback_location: root_url)
    else
      flash[:danger] = "Micropost create failed"
      redirect_back(fallback_location: root_url)
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_back(fallback_location: root_url)
    # redirect_to request.referrer || root_url # related to the request.original_url variable used in friendly forwarding, is just the previous URL
  end

  private

  def set_micropost
    @micropost = Micropost.find(params[:id])
    redirect_to root_url if @micropost.nil?
  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def require_permitted_user
    if !current_user && !current_user.admin?
      flash[:alert] = "You are not permitted to make changes"
      redirect_back(fallback_location: root_url)
    end
  end
end
