Ciudadaniaviva::Application.routes.draw do
  resources :testimonials


  resources :supports

  get '/directories/create_directory' => 'directories#create_directory'
  get '/locations/create_location' => 'locations#create_location'

  resources :directories


  resources :locations do
    collection { post :import }
  end


  resources :causes

  match "/auth/:provider/callback" => "sessions#create"
  root :to => 'causes#index'

  match '/signout' => 'sessions#destroy'
  match '/:cause' => 'causes#show'





end
