class ListingsController < ApplicationController

  def index
    @listings = current_user.listings.all

  end

  def show
    listing       = current_user.listings.find(params[:id])
    @html         = listing.html
    @listing_name = listing.name

  end

  def create
    listing       = current_user.listings.new
    listing.name  = params["listing"]["name"]
    listing.html  = cookies[:website_markup].html_safe
    listing.save

    redirect_to root_path, alert: "You have successfully saved your listing. Click 'View Listings' For Future Use"
  end

end