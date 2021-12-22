class IntroController < ApplicationController

	def index 
		if signed_in?
			redirect_to '/valera'
		end
	end

end
