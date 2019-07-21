class HomeController < ApplicationController
  # アクション実行前 共通処理：ログイン確認
  before_action :forbid_login_user

  # トップページ
  def top
  end

  # 紹介ページ
  def about
  end
end
