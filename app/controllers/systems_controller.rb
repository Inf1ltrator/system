class SystemsController < ApplicationController

	#Фильтр для проверки авторизации
	before_filter :signed_in, only:[:add, :leave, :destroy, :edit, :update, :new, :create]
	#Фильтр для загрузки пользователя 
	before_filter :load_user
	#Фильтр для загрузки системы по id
	before_filter :set_system, only:[:add, :leave, :show, :destroy, :edit, :update, :create]
	#Фильтр для проверки создателя системы
	before_filter :check_owner, only:[:destroy, :edit, :update]

	def show
		@users = @system.users
	end

	def new
		@system = System.new
	end

	def create
		@system = System.new(system_params) 
		if @system.save
			@system.uid = @user.id
			@system.save
			@user.lists.create(system: @system)
			redirect_to @system
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@system.update(system_params)
		if @system.save
			redirect_to @system
		end
		render 'edit'
	end 

	def destroy
		@system.destroy
		redirect_to @user
	end

	def add
		if (!@system.users.include?(@user) && (@system.uid != @user.id))
			@system.users << @user
			redirect_to @system
		else
			render_403
   		end
	end

	
	def leave
		if (  @system.users.include?(@user) && @system.uid != @user.id )
			@system.users.destroy(@user)
			redirect_to @system
		else
			render_403
		end
	end

	private

	def system_params
		params.require(:system).permit(:name,:description,:tag,:system_type)
	end

	def set_system
		@system = System.find_by_id(params[:id])
	end

	def check_owner
		render_403 unless @system.uid == current_user.id 
	end

end
