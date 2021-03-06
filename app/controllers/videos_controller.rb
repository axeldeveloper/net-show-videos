class VideosController < ApplicationController

    before_action :authorize 
    # before_action :correct_user?, only: [:edit, :update, :destroy]
    # before_action :correct_user?, only: [:index, :show, :new, :create, :edit, :update, :destroy]
   
    before_action :helper_actual_user, only: [:create] 
    rescue_from ActiveRecord::RecordNotFound, :with => :rescue_not_found

  def index
    if params[:store]
      #@persons = Person.where('nome LIKE ?', "%#{params[:store]}%")
      @videos = Video.search(params[:store])
    else
      @videos = Video.all
    end
  end

  def show
    @video = Video.find(params[:id]) 
    rescue
      render 'record_not_found'
  end

  def new
    @video = Video.new   
  end

  def create
    puts @current_user.name
    @nome = params[:video][:nome]
    @url  =  params[:video][:url]
    #  #user_id: _user.id
    @video = Video.create(nome: @nome,  url:  @url, user: @current_user)
        if  @video  
            flash[:notice] = 'Video added!'   
            redirect_to videos_path              
        else                   
            flash[:alert] = @video.errors.full_messages.to_sentence
            render :new        
        end      
  end

  def edit
      @video = Video.find(params[:id])
  rescue
      render 'record_not_found'
  end

  def update
    @video = Video.find(params[:id])   
    if @video.update_attributes(setparams)   
        flash[:notice] = 'Video updated!'   
        redirect_to video_path   
    else   
        flash[:alert] = 'Failed to update Video!'   
        render :edit   
    end  
  end

  def destroy
    @video = Video.find(params[:id]) 
    if @video.destroy
        flash[:notice] = 'Video deleted!'
        redirect_to videos_path
    end    
  end

  private
    def setparams
        params.require(:video).permit(
            :nome, 
            :url) 
    end
  
  protected
    def rescue_not_found
      #head :forbidden
      render :template => "/error/404.html.erb", :status => 404
    end
end
