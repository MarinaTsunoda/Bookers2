class BooksController < ApplicationController

  
  def show
    @book_show=Book.find(params[:id])
    @book=Book.new
    @user=@book_show.user
  end

  def index
    @books=Book.all
    @book=Book.new
    @user=current_user
  end

  def edit
    @book=Book.find(params[:id])
    unless current_user == @book.user
      redirect_to books_path
    end
  end
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      flash[:alert]="The upload failed due to an error."
      render:edit
    end
  end
  
  def create
    @user=current_user
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
       flash[:notice]="You have created book successfully."
       redirect_to book_path(@book.id)
    else
      flash[:alert]="The upload failed due to an error."
       @books=Book.all
       render:index
    end
  end
  
  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
      params.require(:book).permit(:title, :body, :user_id)
  end
end