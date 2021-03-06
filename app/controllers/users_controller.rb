class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def index
        users = User.all
        render json: users
    end
  
    def profile
        render json: { user: UserSerializer.new(current_user)}, status: :accepted
    end
    
    def create
      @user = User.create(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
      if @user.valid?
        @token = encode_token(user_id: @user.id)
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end

    def update
      user = current_user
      book = Book.find(params[:book_id])

      if params[:favorite] === true
          if !user.books.include?(book)
              user.books << book
              render json: { addBook: BookSerializer.new(book), message: "favorite added!" }
          else
              favorite = FavoriteBook.create(user_id: user.id, book_id: book.id)
              if user.save
                  user.save
                  render json: { removeBook: BookSerializer.new(book), message: "favorite added!"}
              else
                  render json: { message: "add_favorite failed :(" }
              end
          end
      else
          if user.books.include?(book)
              user.books = user.books - [book]
              if FavoriteBook.find_by(:book_id => book.id, :user_id => user.id)
                  FavoriteBook.find_by(:book_id => book.id, :user_id => user.id).destroy
                  if user.save
                      user.save
                      render json: { removeBook: BookSerializer.new(book), message: "favorite removed!"}
                  else
                      render json: { message: "removing favorite failed :("}
                  end
              else
                # byebug
                render json: { removeBook: BookSerializer.new(book), message: "favorite removed!"}
              end
          end
      end
    end

    # def currently_reading
    #   user = current_user
    #   book = Book.find(params[:book_id])
    #   if params[:current] === true
    #       user.current_books.push(book)
    #       render json: { currentBook: book, message: "current book added" }
    #   else
    #     user.current_books - [book]
    #     render json: {message: "book removed"}
    #   end
    # end

    def logout
      render json: { success: 'Successful logout'}
    end
    # am aware that this means you can logout when already logged out just go with it

  end 