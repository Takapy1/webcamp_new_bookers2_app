class Book < ApplicationRecord
  include BooksHelper
  belongs_to :user
  has_many :favorites
  has_many :book_comments
  validates :title, presence: true, on: [:create, :update]
  validates :body, presence: true, on: [:create, :update], length: {maximum: 200 }
end
