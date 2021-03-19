class BookCommentsController < ApplicationController
  def create
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = params[:id]
    @book_comment.save
    redirect_to request.referer
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  private

  def correct_user_destroy
    comment = BookComment.find(params[:id])
    redirect_to(books_path) unless comment.user_id == current_user.id
  end
end
