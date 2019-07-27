class HomeController < ApplicationController
  def index
    @Pins = Pin.all
  end
end
