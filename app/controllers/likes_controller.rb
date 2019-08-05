class LikesController < ApplicationController
  before_action :find_pin

  def create
    if already_liked?
      flash[:notice] = "No puedes dar un like más de una vez"
    else
      @pin.likes.create(user_id: current_user.id)
    end
    #@pin=Pin.find(params[:id])
    redirect_to pin_path(@pin)

  end

  private

  def find_pin
    @pin = Pin.find(params[:pin_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, pin_id:
    params[:pin_id]).exists?
  end

end
