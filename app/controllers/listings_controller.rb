class ListingsController < ApplicationController

  def index
    @listings = current_user.listings.all

  end

  def show
    @html = current_user.listings.find(params[:id]).html
  end

  def create
    listing = current_user.listings.new
    listing.name  = params["listing"]["name"]
    listing.html  = cookies[:website_markup].html_safe
    listing.save

    redirect_to root_path, alert: "You have successfully saved your listing. Click 'View Listings' For Future Use"
  end

end