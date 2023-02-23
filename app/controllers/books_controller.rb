class BooksController < ApplicationController
  def show
  end

  def index
    @books=Book.all
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end
  def create
    @book=Book.new(params[:id])
    @book.save
    redirect_to book_path(@book.id)
  end
end
