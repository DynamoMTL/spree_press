class CreateSpreePressClippings < ActiveRecord::Migration
  def change
    create_table :spree_press_clippings do |t|
      t.string :title
      t.string :pdf_file_name
      t.string :pdf_content_type
      t.string :cover_file_name
      t.string :cover_content_type
      t.integer :pdf_file_size
      t.integer :cover_file_size
      t.datetime :pdf_updated_at
      t.datetime :cover_updated_at
      t.text :teaser
      t.text :content
      t.string :url

      t.timestamps
    end
  end
end
