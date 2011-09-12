class DemoController < ApplicationController

  def index
  	render ('index')
  	#redirect_to(:action => 'hello')
  end
  
  def hello  	
  	#render(:text => 'oh hai')
	@page = params[:page].to_i
  	render ('hello')
  end
  	
  def other_hello
    redirect_to("http://google.com")
  end
  
  def javascript
    
    end		

end
