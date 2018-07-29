class SessionsController < ApplicationController
    def new
    end
  
    def create
        user = User.find_by(email: params[:session][:email])
    
        if user&.authenticate(params[:session][:password])
            session[:user_id] = user.id
    
            flash[:success] = "Thanks for signing in, #{user.first_name}!"
            if user.admin

                redirect_to admin_dashboard_index_path
            else
                redirect_to home_path
            end
        else
            flash[:danger] = "Invalid email or password"
            redirect_to new_session_path
        end
    end
  
    def destroy
        session[:user_id] = nil
        redirect_to home_path
    end
end
