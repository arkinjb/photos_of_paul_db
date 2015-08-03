class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.timestamps null: false
      t.references :user, index: true, foreign_key: true
      t.references :photo, index: true, foreign_key: true
    end
  end
end
