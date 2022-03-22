module Api
  module V1
    class BooksController < Api::V1::BaseController
      def index
        meta = BookPresenter.new.meta
        render json: BookSerializer.new(books, { meta: meta })
      end

      def show
        render json: BookSerializer.new(book)
      end

      def create
        @book = Book.new(book_params.to_h)

        if @book.save
          render json: BookSerializer.new(@book), status: :created
        else
          render json: { errors: @book.errors }, status: :unprocessable_entity
        end
      end

      def update
        if book.update(book_params)
          render json: BookSerializer.new(book), status: :created
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
        permited_params = params.require(:book).permit(:title, :body, :author)
        book_contract(permited_params)
      end

      def book_contract(permited_params)
        contract = BookParamsContract.new
        contract.call(permited_params.to_h)
      end

      def book
        @book ||= Book.find(params[:id])
      end

      def books
        @books ||= Book.all
      end
    end
  end
end
