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


  namespace :admin do
    resources :items
    resources :customers
    resources :orders
    resources :genres
  end
  namespace :admin do
    root :to => "homes#top"

  end

  namespace :public do
    root :to => "homes#top"
    resources :addresses
    resources :items
    get 'orders/thanks' => 'orders#thanks'
    post 'orders/confirm' => 'orders#confirm'
    resources :orders
    resources :cart_items

    resources :customers
    get "customers/quit", as: "quit"
    resources :customer
    delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'


    resources :customers, except: [:show] do
      collection do                                           # resourcesで定義されるアクション以外を追加する(URIにidを挟まない場合はcollection)
        get "quit"                                            # quitのルーティング
        get "mypage" => 'customers#show'                      # mypageのルーティング
      end
      member do                                               # resourcesで定義されるアクション以外を追加する(URIにidを挟む場合はmember)
        patch "withdraw" => "customers#withdraw"          # 論理削除用のルーティング
      end
    end

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
