class BookmarkedPlacesController < ApplicationController
  before_action :set_tip, only: [:create]

  def index
    @bookmarked_places = BookmarkedPlace.where(user: current_user)
  end

  def create
    @bookmarked_place = BookmarkedPlace.new
    @bookmarked_place.tip = set_tip
    @bookmarked_place.user = current_user

    if @bookmarked_place.save
      redirect_to city_path(@bookmarked_place.tip.city)
    else
      render :show, status: :unproccessable_entity
    end
  end

  def destroy
    @bookmarked_place = BookmarkedPlace.find(params[:id])
    @bookmarked_place.destroy
    redirect_to tip_bookmarked_place_path

  end

  private

  def set_tip
    Tip.find(params[:tip_id])
  end
end
