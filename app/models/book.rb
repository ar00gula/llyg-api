class Book < ApplicationRecord
    belongs_to :author
    has_many :reviews
    has_many :favorite_books
    has_many :book_tags
    has_many :tags, through: :book_tags
end
