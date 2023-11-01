class BooksController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :index]
    
    def index
        @books = Book.all
    end

    def new
    @book = Book.new
    end

    def create
    @book = Book.new(book_params)
    if @book.save
        SendEmailJob.perform_async(current_user.id, @book.id)
        redirect_to books_path, notice: "Buku berhasil dibuat."
    else
        render :new
    end
    end

    private

    def book_params
    params.require(:book).permit(:title, :tahun_terbit, :author_id)
    end
end
