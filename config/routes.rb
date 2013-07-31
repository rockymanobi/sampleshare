ImpressShare::Application.routes.draw do
  root :to => 'proc#sample'
  resources :proc do
    post :refresh, on: :collection
    get :load_mark_down, on: :collection
    post :refresh_slide, on: :collection
  end

end
