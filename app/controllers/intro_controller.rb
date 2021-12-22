class IntroController < ApplicationController

	def index 
		if signed_in?
			redirect_to '/valera'
		end
	end

	def new_game; end

end
