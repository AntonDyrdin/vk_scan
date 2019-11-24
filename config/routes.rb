Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'main_page#index'

  get 'login' , to: 'sessions#login'
  get 'callback' , to: 'sessions#callback'
  delete 'destroy' , to: 'sessions#destroy'
  
  get 'download' , to: 'download#index'

  post 'start_scan_by_fork' , to: 'main_page#start_scan_by_fork'

  # http://localhost:3000/get_file?file_name=WhenOnline277275242.txt
  namespace :api do
    get 'get_file', to: 'files#get_file'
  end
end
