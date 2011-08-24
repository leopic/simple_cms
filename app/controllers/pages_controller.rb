class PagesController < ApplicationController
  
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
  end  
  
  def create
    #nueva instancia usando parametros
    @page = Page.new(params[:page])
    #si el save funciona
    if @page.save
      #redirecciona
      flash[:notice] = "Page created succesfully."
      redirect_to(:action => "list")
    else
      #sino, lo manda de nuevo al new
      render("new")
    end
  end
  
end
