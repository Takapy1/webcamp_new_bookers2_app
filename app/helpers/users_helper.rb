module UsersHelper

  def favorite?(book_id)
    favorites.where(book_id: book_id).exists?
  end

end
