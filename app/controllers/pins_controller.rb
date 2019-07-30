class PinsController < ApplicationController
  def index
    # Setup search
    if params[:q].present?
      #@Pins= Pin.where('name like ?',"%={params[:q]}%")
      @Pins= Pin.where('name like ?',"%#{params[:q]}%")
      
    else
      @Pins = Pin.all
    end
  end

  def new
    @pin = Pin.new
#    @pin = Pin.create(params[:name])
  end

  def create
    @pin = Pin.new(pin_params)

    #@pin.save
    #redirect_to pins_path, :notice => "Pin subido con exito"
    if @pin.save
      #redirect_to @pin
      redirect_to :controller => 'home', :action => 'index'
    else
      render 'new'
    end
  end

  private
    def pin_params
      params.require(:pin).permit(:name, :image, :description, :q)
    end

  def edit
  end
end
