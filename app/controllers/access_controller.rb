class AccessController < ApplicationController
  
  before_filter :confirm_logged_in, :only => [:index, :menu]
  def index
    menu
    render('menu')
  end
  
  def menu
    #text and links
  end

  def login
    #form
  end
  
  def attempt_login
    authorized_user = AdminUser.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "Ya entrajte jodido"
      redirect_to(:action => 'menu')
    else
      flash[:notice] = "Y U NO ENTAR RITGH PASSWORDS?!!"
      redirect_to(:action => 'login')
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Des-logueated"
    redirect_to(:action => "login")
  end

end
