Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  get 'genres/index'
  get 'genres/edit'
# 顧客用
# # URL /customers/sign_in ...
 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  root :to => "homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  # 論理削除用のルーティング
  patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'


  namespace :admin do
    resources :items
    resources :customers
    resources :orders
    resources :genres
  end
  namespace :admin do
    root :to => "homes#top"


    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'

    # get 'orders/index'
    # get 'orders/show'
  end
  namespace :public do
    root :to => "homes#top"
    resources :addresses
    resources :items
    resources :orders
    post 'orders/confirm' => 'orders#confirm'
    resources :cart_items
    resources :customers
    get "customers/quit", as: "quit"
    resources :customer

    # get 'addresses/inidex'
    # get 'addresses/edit'
  end

  # namespace :public do
  #   get 'items/index'
  #   get 'items/show'

  # end
  # namespace :public do
  #   get 'orders/new'
  #   get 'orders/thanks'
  #   get 'orders/index'
  #   get 'orders/show'
  # end
  # namespace :public do
  #   get 'cart_items/index'
  # end
  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/quit'
  #   get 'customers/edit'
  # end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
