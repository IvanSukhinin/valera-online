class IntroController < ApplicationController
  def index
    redirect_to '/valera' if signed_in?
  end

  def new_game; end
end
