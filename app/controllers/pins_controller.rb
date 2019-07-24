class PinsController < ApplicationController
  def index
    @Pins = Pin.all
  end

  def show
  end

  def edit
  end
end
