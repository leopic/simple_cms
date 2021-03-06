class SectionsController < ApplicationController
  
  before_filter :confirm_logged_in
  before_filter :find_page
  
  def index
    list
    render("list")
  end
  
  def list
    @sections = Section.sorted.where(:page_id => @page.id)
  end
  
  def show
    @section = Section.find(params[:id])
  end
  
  def new
    # solo se usa si queremos presentar algo en para el create, algun valor default por ejem
    # @section = Section.new(:name => "default")
    @section = Section.new(:page_id => @page.id)
    @sections_count = @page.sections.size + 1
    @pages_available = Page.all(:select => :id).collect(&:id)
  end
  
  def create
    # nueva instancia usando parametros
    new_position = params[:section].delete(:position)
    @section = Section.new(params[:section])
    @subject = Subject.find(@section.page_id)
    # si el save funciona
    if @section.save
      @section.move_to_position(new_position)
      # redirecciona
      flash[:notice] = "section created succesfully."
      redirect_to(:action => "list", :page_id => @page.id, :subject_id => @subject.id)
    else
      # sino, lo manda de nuevo al new
      @sections_count = @page.sections.size + 1
      @pages_available = Page.all(:select => :id).collect(&:id)
      render("new")
    end
  end
  
  def edit
    @section = Section.find(params[:id])
    @sections_count = @page.sections.size
    @pages_available = Page.all(:select => :id).collect(&:id)
  end 
  
  def update
    new_position = params[:section].delete(:position)
    # nueva instancia usando parametros
    @section = Section.find(params[:id])
    @subject = Subject.find(@section.page_id)
    # si el update funca
    if @section.update_attributes(params[:section])
      @section.move_to_position(new_position)
      # redirecciona
      flash[:notice] = "section edited succesfully."
      redirect_to(:action => "show", :id => @section.id, :page_id => @section.page_id, :subject_id => @subject.id)
    else
      #sino, lo manda de nuevo al edit
      @sections_count = @page.sections.size
      @pages_available = Page.all(:select => :id).collect(&:id)
      render("edit")
    end
  end
  
  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    #nueva instancia usando parametros
    section = Section.find(params[:id]).destroy
    section.move_to_position(nil)
    section.destroy
    #como no vamos a hacer nada con el objeto no ocupamos instanciarlo/mostrarlo, nos ahorramos la variable de instancia
    flash[:notice] = "section destroyed succesfully."
    redirect_to(:action => "list", :page_id => @page.id)
  end

  private

  def find_page
    if params[:page_id]
      @page = Page.find_by_id(params[:page_id])
    end
  end
  
end
