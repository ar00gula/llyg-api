class BooksController < ApplicationController
# I am choosing not to do strong params for time, they will be added before this app goes live
skip_before_action :authorized

    def index
        books = Book.all
        render json: books, each_serializer: BookSerializer
    end

    

end

