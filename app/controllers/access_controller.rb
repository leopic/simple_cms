class AccessController < ApplicationController
  
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
      # TODO: mark user as loggedin??
      flash[:notice] = "Ya entrajte jodido"
      redirect_to(:action => 'menu')
    else
      flash[:notice] = "Y U NO ENTAR RITGH PASSWORDS?!!"
      redirect_to(:action => 'login')
    end
  end
  
  def logout
    # TODO: marcar al mop como des-logeado
    flash[:notice] = "Des-logueated"
    redirect_to(:action => "login")
  end

end
