class PagesController < ApplicationController
  
  before_filter :confirm_logged_in
  before_filter :find_subject
  
  def index
    list
    render ('list')
  end

  def list
    @pages = Page.sorted.where(:subject_id => @subject.id)
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:subject_id => @subject.id)
    @pages_count = @subject.pages.size + 1
    @subjects_count = Subject.all(:select => :id).collect(&:id)
  end

  def create
    #nueva instancia usando parametros
    new_position = params[:page].delete(:position)
    @page = Page.new(params[:page])
    @subjects_count = Subject.count
    #si el save funciona
    if @page.save
      # redirecciona
      @page.move_to_position(new_position)
      flash[:notice] = "Page created succesfully."
      redirect_to(:action => "list", :subject_id => @subject.id)
    else
      #sino, lo manda de nuevo al new
      @pages_count = @subject.pages.size + 1
      @subjects_count = Subject.all(:select => :id).collect(&:id)
      render("new")
    end
  end
  
  def edit
    @page = Page.find(params[:id])
    @pages_count = @subject.pages.size
    @subjects_count = Subject.all(:select => :id).collect(&:id)
  end
  
  def update
    # nueva instancia usando parametros
    @page = Page.find(params[:id])
    # si el update funca
    new_position = params[:page].delete(:position)
    if @page.update_attributes(params[:page])
      @page.move_to_position(new_position)
      # redirecciona
      flash[:notice] = "Page edited succesfully."
      redirect_to(:action => "show", :id => @page.id, :subject_id => @page.subject_id)
    else
      # sino, lo manda de nuevo al edit
      @subjects_count = Subject.all(:select => :id).collect(&:id)
      @pages_count = @subject.pages.size
      render('edit')
    end
  end
  
  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    #nueva instancia usando parametros
    page = Page.find(params[:id]).destroy
    page.move_to_position(nil)
    page.destroy
    #como no vamos a hacer nada con el objeto no ocupamos instanciarlo/mostrarlo, nos ahorramos la variable de instancia
    flash[:notice] = "Page destroyed succesfully."
    redirect_to(:action => "list", :subject_id => @subject.id)
  end
  
  private
  
  def find_subject
    if params[:subject_id]
      @subject = Subject.find_by_id(params[:subject_id])
    end
  end

end