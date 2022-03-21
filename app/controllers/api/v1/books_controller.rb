class Api::V1::BooksController < Api::V1::BaseController
  def index
    render json: books
  end

  def show
    render json: book
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: book, status: :created
    else
      render json: { errors: book.errors }, status: :unprocessable_entity
    end
  end

  def update
    if book.update(book_params)
      render json: book, status: :created
    else
      render json: { errors: book.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if book.destroy
      render json: {}, status: :ok
    else
      render json: { errors: book.errors }, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :author)
  end

  def book
    @book ||= Book.find(params[:id])
  end

  def books
    @books ||= Book.all
  end
end
