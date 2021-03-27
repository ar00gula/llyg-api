class Book < ApplicationRecord
    belongs_to :author
    has_many :reviews
    has_many :favorite_books
end
