class PinsController < ApplicationController
  def index
    # Setup search
    if params[:q].present?
      #@Pins= Pin.where('name like ?',"%={params[:q]}%")
      @pins= Pin.where('name like ?',"%#{params[:q]}%")    
    else
      @pins = Pin.all
    end
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.user_id = current_user.id
    #@pin.save
    #redirect_to pins_path, :notice => "Pin subido con exito"
    if @pin.save
      #redirect_to @pin
      #redirect_to :controller => 'pins', :action => 'index'
      render 'show'
    else
      render 'new'
    end
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @pin = Pin.find(params[:id])
    if @pin.update(pin_params)
      redirect_to 'pins/index'
    else
      render 'edit'
    end
  end

  def destroy
    @pin = Pin.find(params[:id])
    if @pin.delete
      redirect_to('pins/index')
    end
  end

  def pinsof
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @pins = @user.pins
  end

  def mypins
    @pins = current_user.pins
  end


  private
    def pin_params
      params.require(:pin).permit(:name, :description, :q, :image)
    end

  

  def content
    @pin_id = params[:id]
    #@pin = Pin.find(@pin_id)
  end

  

  
end
