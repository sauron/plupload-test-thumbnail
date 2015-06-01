Testplupload::Application.routes.draw do
  resources :presses

  match "/" => 'presses#index'
  root :to  => 'presses#index'
end
