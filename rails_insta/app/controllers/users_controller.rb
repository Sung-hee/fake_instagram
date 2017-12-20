class UsersController < ApplicationController
  def signup
  end

  def register
    User.create(
      email: params[:email],
      password: params[:password],
    )
    redirect_to '/'
  end

  def login
  end

  def login_session
    user = User.find_by(email: params[:email])
    if user
      if user.password == params[:password]
        session[:user_id] = user.id
        redirect_to '/'
      else
        puts "비밀번호가 틀렸습니다."
        redirect_to '/users/login'
      end
    else
      puts "회원가입을 하세요"
      redirect_to '/users/signup'
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end
end