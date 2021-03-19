class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, book_id: params[:id])
    redirect_to request.referer
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, book_id: params[:id]).destroy
    redirect_to request.referer
  end
end
