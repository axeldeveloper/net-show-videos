class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :authorize, except: [:new, :create]
  #before_action :correct_user?, only: [:edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_not_found
  
  

  
  
  # GET /users
  # GET /users.json
  def index
    if params[:store]
      #@persons = Person.where('nome LIKE ?', "%#{params[:store]}%")
      @users = User.search(params[:store])
    else
      @users = User.all
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id]) 
  rescue
      render 'record_not_found'
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  rescue
      render 'record_not_found'
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


  protected
    def rescue_not_found
      #head :forbidden
      render :template => "/error/404.html.erb", :status => 404
    end
end
