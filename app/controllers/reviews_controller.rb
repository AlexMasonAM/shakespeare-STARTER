class ReviewsController < ApplicationController

  def new
    user = User.find(params[:user_id])
    book = Book.find(params[:book_id])
    @review = Review.new(user_id: user.id, book_id: book.id)
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to books_path
    else
      flash[:error] = @review.errors.full_messages
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:user_id, :book_id, :body)
  end

end