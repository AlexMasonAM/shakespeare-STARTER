class FavoritesController < ApplicationController
  
  def create

    Favorite.create(favorite_params)
    # fav.user = current_user
    redirect_to books_path
  end

private

  def favorite_params
    params.permit(:book_id, :user_id)
  end
end
