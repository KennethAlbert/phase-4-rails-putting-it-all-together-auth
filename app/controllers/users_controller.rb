class UsersController < ApplicationController
skip_before_action :authorize



def create
    user=User.create!(user_params)
    if user.valid?
    session[:user_id]=user.id
    render json:user,status: :created
    end
    
end

def show
if session[:user_id]
render json: User.find(session[:user_id])
else
render json: { error: "Access restricted" }, status: :unauthorized
end

end


    private 

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)

    end

  
end
