Rails.application.routes.draw do
  # トッップページ
  get "/" => "home#top"
  # 紹介ページ
  get "about" => "home#about"
  # 投稿一覧ページ
  get "index" => "posts#index"
  # 新規投稿ページ
  get "newPost" => "posts#newPost" 
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
end
