class SimplePagesController < ApplicationController

	def index
		@systems = System.all
	end

	def about
	end

end
