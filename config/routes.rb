Rails.application.routes.draw do
  root 'questions#index'

  resources :questions  do
    resources :answers , expect: %i[new show] # кроме этих маршрутов
  end

end


  # get '/questions' , to: 'questions#index'

  # get '/questions/new' , to: 'questions#new'

  # get '/questions/:id/edit' , to: 'questions#edit'

  # post '/questions' , to: 'questions#create'