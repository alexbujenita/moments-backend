class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.text :caption
      t.string :aws_filename
      t.string :aws_url

      t.timestamps
    end
  end
end
