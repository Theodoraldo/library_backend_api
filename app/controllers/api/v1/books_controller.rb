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

        if params[:book][:image]
            @book.image = decode_image(params[:book][:image])
        end

        if @book.save
        render json: @book, status: :created
        else
        render json: @book.errors, status: :unprocessable_entity
        end
    end

    def update
        if params[:book][:image]
            @book.image = decode_image(params[:book][:image])
        end

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

    def decode_image(data)
      mime_type, base64_image = data.split(',')

      extension = mime_type.split('/')[0].split(';')[1]

      decoded_data = Base64.decode64(base64_image)
        
      temp_img_file = Tempfile.new(['image', ".#{extension}"])

      temp_img_file.binmode
      temp_img_file.write(decoded_data)
      temp_img_file.rewind

      img_params = {filename: "image.#{extension}", type: mime_type, tempfile: temp_img_file}

      ActionDispatch::Http::UploadedFile.new(img_params)
    end

    
    def book_params
        params.require(:book).permit(:title, :author, :genre_id, :published_date, :available_copies, :pages, :note)
    end
end
