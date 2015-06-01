Testplupload::Application.routes.draw do
  resources :annoucements

  root to: 'annoucements#index'
end
