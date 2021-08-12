class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
      @book = Book.find(params[:id])
  end

  def edit
      @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:succes] = 'Book was successfully updated.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:succe] = 'Book was successfully destroyed.'
    redirect_to books_path
  end
  
  def create
     @book = Book.new(book_params)
    if @book.save
      flash[:notic] = 'Book was successfully created.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

private
def book_params
     params.require(:book).permit(:title, :body)
end

end
