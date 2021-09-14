class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      # フラッシュメッセージ　createが成功した時
      flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book)
    else
      @books = Book.all
      render ("books/index")
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "Book was successfully updated."
       redirect_to book_path(@book.id)
    else
       render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  # ストロングパラメータ
  private
  def book_params
    # params.require(:book).permit(:title, :body)とすると「存在しない」か「空」というエラーになる
    params.require(:book).permit(:title, :body)
  end

end