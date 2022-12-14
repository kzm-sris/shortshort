class FavoritesController < ApplicationController
  
  def create
    post_book = PostBook.find(params[:post_book_id])
    favorite = current_user.favorites.new(post_book_id: post_book.id)
    favorite.save
    redirect_to post_book_path(post_book)
  end
  
  def destroy
    post_book = PostBook.find(params[:post_book_id])
    favorite = current_user.favorites.find_by(post_book_id: post_book.id)
    favorite.destroy
    redirect_to post_book_path(post_book)
  end
end
