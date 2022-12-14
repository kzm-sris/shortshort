class PostBooksController < ApplicationController
  def new
    @post_book = PostBook.new
  end
  
  def create
    @post_book= PostBook.new(post_book_params)
    @post_book.user_id = current_user.id
    if @post_book.save
      redirect_to post_books_path
    else
      render :new
    end
  end

  def index
    @post_books = PostBook.all
  end

  def show
    @post_book = PostBook.find(params[:id])
  end
  
  def destroy
    @post_book = PostBook.find(params[:id])
    @post_book.delete
    redirect_to post_books_path
  end
  
  private

  def post_book_params
    params.require(:post_book).permit(:title, :body, :caption)
  end
end
