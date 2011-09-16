class SectionsController < ApplicationController
  
  def index
    list
    render("list")
  end
  
  def list
    @sections = Section.order("sections.position ASC")
  end
  
  def show
    @section = Section.find(params[:id])
  end
  
  def new
    #solo se usa si queremos presentar algo en para el create, algun valor default por ejem
    #@section = Section.new(:name => "default")
    @section = Section.new
    @sections_count = Section.count + 1
    @pages_available = Page.all(:select => :id).collect(&:id)
  end
  
  def create
    #nueva instancia usando parametros
    @section = Section.new(params[:section])
    #si el save funciona
    if @section.save
      #redirecciona
      flash[:notice] = "section created succesfully."
      redirect_to(:action => "list")
    else
      #sino, lo manda de nuevo al new
      @sections_count = Section.count + 1
      @pages_available = Page.all(:select => :id).collect(&:id)
      render("new")
    end
  end
  
  def edit
    @section = Section.find(params[:id])
    @sections_count = Section.count
    @pages_available = Page.all(:select => :id).collect(&:id)
  end 
  
  def update        
    #nueva instancia usando parametros
    @section = Section.find(params[:id])
    #si el update funca
    if @section.update_attributes(params[:section])
      #redirecciona
      flash[:notice] = "section edited succesfully."
      redirect_to(:action => "show", :id => @section.id)
    else
      #sino, lo manda de nuevo al edit
      @sections_count = Section.count
      @pages_available = Page.all(:select => :id).collect(&:id)
      render("edit")
    end
  end
  
  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    #nueva instancia usando parametros
    Section.find(params[:id]).destroy
    #como no vamos a hacer nada con el objeto no ocupamos instanciarlo/mostrarlo, nos ahorramos la variable de instancia
    flash[:notice] = "section destroyed succesfully."
    redirect_to(:action => "list")
  end  
  
end
