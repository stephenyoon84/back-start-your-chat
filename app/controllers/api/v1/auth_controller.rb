class Api::V1::AuthController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        token = encode_token({user_id: user.id})
        json = {token: token, success: true, username: user.username}
    else
        json = {errors: "something went wrong.  You are not the Spice you say you are.",
                success: false}
    end
    render json: json
  end

end
