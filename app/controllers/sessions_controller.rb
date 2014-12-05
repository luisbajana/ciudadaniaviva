class SessionsController < ApplicationController
	def create  
	    auth = request.env["omniauth.auth"]  
	    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)  
	    session[:id] = user.id
	    redirect_to request.env['omniauth.origin'] || '/default', :notice => "¡Hola! Bienvenid@"  
  	end  

  	def destroy  
  		session[:id] = nil  
  		redirect_to root_url, :notice => "¡Chau! Regresa pronto"  
	end  

end
