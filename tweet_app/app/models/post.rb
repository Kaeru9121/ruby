class Post < ApplicationRecord
    # カラム「content」のvalidate 空文字不,最大140字まで
    validates :content, {presence: true, length: {maximum: 140}}
end
