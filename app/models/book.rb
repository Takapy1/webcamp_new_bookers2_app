class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, on: [:create, :update]
  validates :body, presence: true, on: [:create, :update], length: {maximum: 200 }
end
