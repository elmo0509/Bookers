Rails.application.routes.draw do
  # ルートディレクトリのルーティング
  root 'homes#index'
  
  # resourcesを使用してルーティング設定
  resources :books
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
