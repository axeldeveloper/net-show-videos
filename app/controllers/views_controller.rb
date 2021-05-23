class ViewsController < ApplicationController

  def create
      @video = Video.find(params[:id])  
      @view  = View.find_by(video: @video) rescue nil
     
      if @view == nil
        create_view(@video)       
      else      
        update_view(@view)              
      end
  end

  def create_view(video)
    @view = View.new
    @view.total = 1
    @view.video = video
    if @view.save
      return render json: {status: :created, row: @view }
    end 
  end  


  def update_view(view)
    @increment = (view.total += 1)
    view.update(total: @increment)
    return render json: {status: :update, row: @view }
  end


end
