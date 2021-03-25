class ReviewsController < ApplicationController

    def create
        review = Review.new(review_params)
        if review.save
            render json: {
                bookId: review.book_id,
                review: {
                    user: review.user,
                    title: review.title,
                    content: review.content,
                    date: review.date
                }
            }
        else 
            render json: {
              status: 'failed',
              errors: review.errors.full_messages
            }
        end
    end

    private

    def review_params
        params.require(:review).permit(:title, :content, :date, :user, :book_id)

    end
end