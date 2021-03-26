class BooksController < ApplicationController

skip_before_action :authorized

    def index
        books = Book.all
        render json: books.to_json(:include => [:author, :reviews])
    end

private

end

