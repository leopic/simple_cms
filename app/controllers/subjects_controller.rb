class SubjectsController < ApplicationController
	
	layout 'admin'
	
	def index
		list
		render("list")
	end
	
	def list
		@subjects = Subject.order("subjects.position ASC")
	end
	
	def show
		@subject = Subject.find(params[:id])
	end
	
	def new
	  #solo se usa si queremos presentar algo en para el create, algun valor default por ejem
		#@subject = Subject.new(:name => "default")
	end
	
	def create
		#nueva instancia usando parametros
		@subject = Subject.new(params[:subject])
		#si el save funciona
		if @subject.save
			#redirecciona
			flash[:notice] = "Subject created succesfully."
			redirect_to(:action => "list")
		else
			#sino, lo manda de nuevo al new
			render("new")
		end
	end
	
	def edit
		@subject = Subject.find(params[:id])
	end	
	
	def update				
		#nueva instancia usando parametros
		@subject = Subject.find(params[:id])
		#si el update funca
		if @subject.update_attributes(params[:subject])
			#redirecciona
			flash[:notice] = "Subject edited succesfully."
			redirect_to(:action => "show", :id => @subject.id)
		else
			#sino, lo manda de nuevo al edit
			render("edit")
		end
	end
	
	def delete
		@subject = Subject.find(params[:id])
	end
	
	def destroy
		#nueva instancia usando parametros
		Subject.find(params[:id]).destroy
		#como no vamos a hacer nada con el objeto no ocupamos instanciarlo/mostrarlo, nos ahorramos la variable de instancia
		flash[:notice] = "Subject destroyed succesfully."
		redirect_to(:action => "list")
	end
	
end
