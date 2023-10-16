Rails.application.routes.draw do
  namespace :admin do

    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'


    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'

    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'addresses/inidex'
    get 'addresses/edit'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'

  end
  namespace :public do
    get 'orders/new'
    get 'orders/thanks'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/quit'
    get 'customers/edit'
  end
  get 'homes/top'
  get 'homes/about'
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
