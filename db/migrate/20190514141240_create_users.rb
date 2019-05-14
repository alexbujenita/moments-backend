class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :instagram
      t.string :flickr
      t.string :avatar
      t.string :avatar_filename
      t.text :bio
      t.string :password_digest

      t.timestamps
    end
  end
end
