class UsersController < ApplicationController

	#Фильтр для проверки авторизации
	before_filter :signed_in
	#Фильтр для загрузки юзера по id
	before_filter :set_system, only:[:show]


	def index
		@users = User.all
	end
	
	def show
	end

	def set_user
		@user = User.find_by_id(params[:id])
	end

end
