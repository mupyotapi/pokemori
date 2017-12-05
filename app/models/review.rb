class Review < ActiveRecord::Base
  belongs_to :product             #productsテーブルとのアソシエーション
  belongs_to :user                #usersテーブルとのアソシエーション

end
