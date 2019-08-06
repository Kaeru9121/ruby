class UsersController < ApplicationController
  # アクション実行前 共通処理
  # 未ログイン確認
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  # ログイン確認
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  # 参照権限確認
  before_action :ensure_correct_user, {only: [:edit, :update]}

  # ユーザ一覧ページ
  def index
    @users = User.all
  end

  # ユーザ詳細ページ
  def show
    @user = User.find_by(id: params[:id])
  end

  # ログインページ
  def login_form
  end

  # ログイン判定用アクション
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  # ログアウト用アクション
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  # 新規ユーザー登録ページ
  def signup
    @user = User.new
  end

  # 新規ユーザー登録用アクション
  def create
    @user = User.new(name: params[:name], email: params[:email], image_name: "default_image.jpg", password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/user/#{@user.id}")
    else
      render("users/signup")
    end
  end

  # ユーザー情報編集ページ
  def edit
    @user = User.find_by(id: params[:id])
  end

  # ユーザー情報更新用アクション
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    # 画像更新処理
    if params[:image]
      image = params[:image]
      @user.image_name = "#{@user.id}.jpg"
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to("/user/#{@user.id}")
    else
      render("users/edit")
    end
  end

  # 参照権限確認
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "参照権限がありません"
      redirect_to("/index")
    end
  end
end
