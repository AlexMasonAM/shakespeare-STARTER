class BooksController < ApplicationController
  before_action :authorize

  def index
    @books = Book.all
  end

end