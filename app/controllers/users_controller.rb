class UsersController < ApplicationController
  
  def secure_params
    params.require(:user).permit(:role)
  end
  
end
