class PostsController < ApplicationController
  # 投稿一覧ページ
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # 新規投稿ページ
  def newPost
  end

  # 投稿詳細ページ
  def show
    @post = Post.find_by(id:params[:id])
  end

  # 投稿編集ページ
  def edit
    @post = Post.find_by(id:params[:id])
  end

  # 投稿保存用アクション
  def create
    @post = Post.new(content:params[:content])
    @post.save
    redirect_to("/index")
  end

  # 投稿更新用アクション
  def update
    @post = Post.find_by(id:params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/index")
  end

  # 投稿削除用アクション
  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy
    redirect_to("/index")
  end
end
