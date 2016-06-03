class TasksController < ApplicationController

	#Фильтр для загрузки системы по system_id
	before_filter :set_system
	#Фильтр для проверки авторизации
	before_filter :signed_in, only:[:destroy, :edit, :update, :new, :create]
	#Фильтр для проверки создателя системы
	before_filter :check_owner, only:[:destroy, :edit, :update, :new, :create]
	#Фильтр для загрузки задачи по id
	before_filter :set_task, only:[:show, :destroy, :edit, :update, :create]

	def show
	end

	def new
		@task = @system.tasks.build
	end

	def create
		@task = @system.tasks.new(task_params)
		@task.save
		redirect_to @system
	end

	def edit
	end

	def update
		@task = @system.tasks.update(task_params)
		@task.save
		redirect_to @system
	end

	def destroy
		@task.destroy
		redirect_to @system
	end

	private

	def set_system
    	@system = System.find(params[:system_id])
  	end

  	def task_params
		params.require(:task).permit(:name, :description)
	end

	def set_task
		@task = Task.find_by_id(params[:id])
	end

	def check_owner
		render_403 unless @system.uid == current_user.id 
	end

end
