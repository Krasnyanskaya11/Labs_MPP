Rails.application.routes.draw do
  resources :patient_clinics
  resources :catalogs
  devise_for :users
  root to: "root#index"
  default_url_options :host => "example.com"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  #маршрут для отображения списка определенной таблицы
  resources :clinics
  get '/clinics' , to: 'clinics#index'
  resources :departments
  get '/departments', to: 'departments#index'
  resources :doctors
  get '/doctors', to: 'doctors#index'
  resources :specialities
  get '/specialities', to: 'specialities#index'
  resources :patients
  get '/patients', to: 'patients#index'
  resources :patient_cards
  get '/patient_cards', to: 'patient_cards#index'
  resources :catalogs
  get '/catalogs', to: 'catalogs#index'
  resources :patient_clinics



end
