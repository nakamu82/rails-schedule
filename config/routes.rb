Rails.application.routes.draw do
  root "posts#index"
  resources :posts
end
  #RESTful ルーティングはresources :posts
  #resources :postsだけで全部やってくれる

  #get "posts/new" =>"posts#new"

  #post "posts/create" =>"posts#create"

  #posts/:idはposts/indexより下に書く
  
  #get "posts/:id/edit" => "posts#edit"
  #post "posts/:id/update" =>"posts#update"
  #post "posts/:id/destroy" =>"posts#destroy"
  
  #get "posts/:id" =>"posts#show"

  # Defines the root path route ("/")
  # root "posts#index"
  
  #コントローラ名は複数形
