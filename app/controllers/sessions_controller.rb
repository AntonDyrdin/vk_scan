class SessionsController < ApplicationController
  def login
      
      srand
      @state = Digest::MD5.hexdigest(rand.to_s)
      session[:state] = @state

      #@vk_url = 'https://oauth.vk.com/authorize?client_id=6703822&display=page&redirect_uri=&scope=wall,offline,messages&response_type=token&v=5.52'
      @vk_url = VkontakteApi.authorization_url(scope: [:friends, :groups, :offline, :notify], state: session[:state])
  end

  def callback
    p "CALLBACK"
    # проверка state
    if session[:state].present? && session[:state] != params[:state]
      redirect_to ENV['root_uri'], alert: 'Ошибка авторизации, попробуйте войти еще раз.' and return
    end

    if params['token'].blank?
      @vk = VkontakteApi.authorize(code: params[:code])
      session[:token] = @vk.token
      session[:vk_id] = @vk.user_id
    else
      session[:token] = params['token']
      session[:vk_id] = '277275242'
    end

    redirect_to ENV['root_uri']
  end

  def destroy
    session[:token] = nil
    session[:vk_id] = nil
    
    redirect_to ENV['root_uri']
  end
end