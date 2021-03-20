class BooksController < ApplicationController
  before_action :authenticate_user, only: [:index, :show, :edit]
  before_action :correct_user_post, only: [:edit, :update, :destroy]

  def index
    @books = Book.all.order(created_at: :desc)
    
    @book = Book.new
    @current_user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to @book
    else
      @books = Book.all.order(created_at: :desc)
      @user = current_user
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  
    @book_new = Book.new

    @user = User.find_by(id: @book.user_id)

    @book_comment = BookComment.new
    @book_comments = @book.book_comments
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

  def correct_user_post
    book = Book.find(params[:id])
    redirect_to(books_path) unless book.user_id == current_user.id
  end
end
