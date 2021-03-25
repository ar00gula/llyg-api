class BooksController < ApplicationController

    def index
        books = Book.all
        render json: books.to_json(:include => [:author, :reviews])
    end

private

end

