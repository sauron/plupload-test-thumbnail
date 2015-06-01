Testplupload::Application.routes.draw do
  resources :presses

  root :to  => 'presses#index'
end
