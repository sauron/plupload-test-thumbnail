Testplupload::Application.routes.draw do
  resources :presses

  match "/" => 'press#index'
  root :to  => 'press#index'
end
