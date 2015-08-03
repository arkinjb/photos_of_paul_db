class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :photo_url
      t.timestamps null: false
      t.references :user, index: true, foreign_key: true
    end
  end
end
