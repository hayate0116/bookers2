class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
    @books = Book.all
  end
  
  def show
    @book = Book.new
    @books = @user.books
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = Useer.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have update book succesfully."
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
end
