class PagesController < ApplicationController
  
  before_filter :confirm_logged_in
  
  def index
    list
    render ('list')
  end
  
  def list
    @pages = Page.order("pages.position ASC")
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def new
    @page = Page.new
    @pages_count = Page.count + 1
    @subjects_count = Subject.all(:select => :id).collect(&:id)
  end  
  
  def create
    #nueva instancia usando parametros
    @page = Page.new(params[:page])
    @subjects_count = Subject.count
    #si el save funciona
    if @page.save
      #redirecciona
      flash[:notice] = "Page created succesfully."
      redirect_to(:action => "list")
    else
      @pages_count = Page.count
      @subjects_count = Subject.all(:select => :id).collect(&:id)
      #sino, lo manda de nuevo al new
      render("new")
    end
  end
  
  def edit
    @page = Page.find(params[:id])
    @pages_count = Page.count
    @subjects_count = Subject.all(:select => :id).collect(&:id)
  end 
  
  def update        
    #nueva instancia usando parametros
    @page = Page.find(params[:id])
    #si el update funca
    if @page.update_attributes(params[:page])
      #redirecciona
      flash[:notice] = "Page edited succesfully."
      redirect_to(:action => "show", :id => @page.id)
    else
      @subjects_count = Subject.all(:select => :id).collect(&:id)
      @pages_count = Page.count
      #sino, lo manda de nuevo al edit
      render('edit')
    end
  end  
  
  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    #nueva instancia usando parametros
    Page.find(params[:id]).destroy
    #como no vamos a hacer nada con el objeto no ocupamos instanciarlo/mostrarlo, nos ahorramos la variable de instancia
    flash[:notice] = "Page destroyed succesfully."
    redirect_to(:action => "list")
  end  
  
end
