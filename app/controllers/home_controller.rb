class HomeController < ApplicationController
  def index
  	@maillots = Maillot.order(:title)
  end
end
