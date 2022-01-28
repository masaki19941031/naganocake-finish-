Rails.application.routes.draw do

 devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
 }

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
 }

  root 'homes#top'
  get '/about',to: 'homes#about'
  get '/search', to: 'searches#search'

  namespace :admins do
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  #customer

    resource :customer, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end

    resources :items, only: [:index, :show]

    resources :cart_items, only: [:index, :update, :create, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end

    resources :orders, only: [:index, :show, :new, :create] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end

    resources :addresses, except: [:show, :new]

end