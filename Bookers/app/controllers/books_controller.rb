class BooksController < ApplicationController
protect_from_forgery

  def edit
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:createdflag] = true
      redirect_to book_path(book.id)
    else
      @books=Book.all
      @book=book
      render:index
    end
  end

  def index
     @books = Book.all
     @book = Book.new
  end

  def show

    @book = Book.find(params[:id])
  end

  def edit
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      flash[:createdflag] = true
      redirect_to book_path(book.id)
    else
      @book=book
      render:edit

    end
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
