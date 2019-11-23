class SessionsController < ApplicationController
  def login

    @vk_url = 'https://oauth.vk.com/authorize?client_id=6703822&display=page&redirect_uri=' + ENV['root_uri'] + '/callback' + '&scope=wall,offline,messages&response_type=token&v=5.52'
  end

  def callback
    if !params['token'].blank?
      $auth_token = params['token']
    end

    redirect_to ENV['root_uri']
  end

  def destroy
    $auth_token = nil
    
    redirect_to ENV['root_uri']
  end
end