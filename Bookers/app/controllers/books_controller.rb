class BooksController < ApplicationController
protect_from_forgery

  def edit
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # ３. show画面へリダイレクト
    redirect_to show_book_url(book.id, "true")
  end

  def index
     @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @createdflag = params[:createdflag]
  end

  def edit
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
