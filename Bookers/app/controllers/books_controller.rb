class BooksController < ApplicationController
protect_from_forgery

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to show_book_url(@book.id, "true")
    else
      @books=Book.all
      render:index
    end
  end

  def index
     @books = Book.all
     @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @createdflag = params[:createdflag]
  end

  def edit
    @books = Book.all
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
   redirect_to show_book_url(book.id, "true")
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
