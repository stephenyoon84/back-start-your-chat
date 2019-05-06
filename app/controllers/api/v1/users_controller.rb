class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      token = encode_token({user_id: user.id})
      json = {token: token, success: true, username: user.username}
    else
      json = {errors: "something went wrong.", success: false}
    end
    render json: json
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
