class PostsController < ApplicationController
  # アクション実行前 共通処理：未ログイン確認
  before_action :authenticate_user

  # 投稿一覧ページ
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # 新規投稿ページ
  def newPost
    @post = Post.new
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
    if @post.save
      flash[:notice] = "投稿を新規作成しました"
      redirect_to("/index")
    else
      render("posts/newPost")
    end
  end

  # 投稿更新用アクション
  def update
    @post = Post.find_by(id:params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/index")
    else
      # アクションを経由せず、htmlファイルを表示する @postの値保持
      render("posts/edit")
    end
  end

  # 投稿削除用アクション
  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/index")
  end
end
