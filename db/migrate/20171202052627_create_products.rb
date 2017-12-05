class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
        t.string      :name #部屋の名前
        t.text        :text #部屋のコメント
        t.text        :image #部屋のスクショ６
        t.timestamps


      t.timestamps
    end
  end
end
