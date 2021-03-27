class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :favorite_books
    has_many :books, through: :favorite_books

    validates :username, { uniqueness: true, length: {minimum: 5} } 
    validates :password, { length: { minimum: 5}, confirmation: { case_sensitive: true} }
end
