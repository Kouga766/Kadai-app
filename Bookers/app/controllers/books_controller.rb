class BooksController < ApplicationController
protect_from_forgery

  def edit
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
  end

  def index
     @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
