class SystemsController < ApplicationController

	def show
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end 

	def destroy
	end

	private

	def system_params
		params.require(:system).permit(:name,:description,:tag)
	end

	def set_system
		@system = System.find_by_id(params[:id])
	end

	def check_owner
		render_403 unless @system.owner_id == current_user.id 
	end

end
