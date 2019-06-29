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
  # 投稿保存用アクション
  post "create" => "posts#create"
end
