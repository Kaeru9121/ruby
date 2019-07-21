Rails.application.routes.draw do
  # ログインページ
  get "login" => "users#login_form"
  # ログイン判定用アクション
  post "login" => "users#login"
  # ログアウト用アクション
  post "logout" => "users#logout"

  # トッップページ
  get "/" => "home#top"
  # 紹介ページ
  get "about" => "home#about"
  # 投稿一覧ページ
  get "index" => "posts#index"
  # 新規投稿ページ
  get "new-post" => "posts#newPost" 
  # 投稿詳細ページ
  get "show/:id" => "posts#show"
  # 投稿編集ページ
  get "edit/:id" => "posts#edit"
  # 投稿保存用アクション
  post "create" => "posts#create"
  # 投稿更新用アクション
  post "update/:id" => "posts#update"
  # 投稿削除用アクション
  post "destroy/:id" => "posts#destroy"

  # 新規ユーザ登録ページ
  get "signup" => "users#signup"
  # ユーザ一覧ページ
  get "user/index" => "users#index"
  # 新規ユーザー登録用アクション
  post "user/create" => "users#create"
  # ユーザー情報編集ページ
  get "user/edit/:id" => "users#edit"
  # ユーザー情報更新用アクション
  post "user/update/:id" => "users#update"
  # ユーザー詳細ページ
  get "user/:id" => "users#show"

end
