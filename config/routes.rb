Rails.application.routes.draw do
  get '/students', to: 'students#index'

  get '/instructors/:id', to: 'instructors#show'
end
