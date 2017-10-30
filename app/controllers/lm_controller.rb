class LmController < ApplicationController
  def sign_up
    if User.where(loginId: params[:userId]).exists?
      myJson = {"result"=> FALSE, "message"=>"회원가입실패"}
      render json: myJson

    else
      u = User.new
      u.loginId = params[:userId]
      u.pw = params[:password]
      u.name = params[:name]
      u.save

      myJson = {"result"=> TRUE, "message"=>"회원가입성공", "user"=>u}
      render json: myJson
    end
  end

  def sign_in
    if User.where(loginId: params[:userId], pw: params[:password]).exists?
      u =  User.where(loginId: params[:userId]).first
      myJson = {"result"=> TRUE, "message"=>"로그인성공", "user"=>u}
      render json: myJson
    else
      myJson = {"result"=> FALSE, "message"=>"로그인실패"}
      render json: myJson
    end
  end
end
