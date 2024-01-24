class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :published_date
      t.integer :available_copies
      t.integer :pages
      t.string :note
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
