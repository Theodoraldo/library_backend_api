class Api::V1::BooksController < ApplicationController
    before_action :set_book, only: [:show, :update, :destroy]

    
    def index
        @books = Book.all
        render json: @books
    end

    def show
        render json: @book
    end

    def create
        @book = Book.new(book_params)

        if @book.save
        render json: @book, status: :created
        else
        render json: @book.errors, status: :unprocessable_entity
        end
    end

    def update
        if @book.update(book_params)
        render json: @book
        else
        render json: @book.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @book.hide_book
        head :no_content
    end

 
    private
  
    def set_book
      @book = Book.find(params[:id])
    end

    
    def book_params
        params.require(:book).permit(:image, :title, :author, :genre_id, :published_date, :available_copies, :pages, :note)
    end
end
