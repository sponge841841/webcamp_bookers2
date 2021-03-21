class UsersController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  def create
  @book = Book.new(book_params)
    if @book.save
      redirect_to ("/books/#{@book.id}"), notice: 'Book was successfully created.'
    else
      @books = Book.all
      render 'index'
    end
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to ("/users/#{@user.id}"), notice: 'User was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
