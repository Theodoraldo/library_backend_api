class CreateBorrowHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :borrow_histories do |t|
      t.date :borrow_date
      t.date :returned_date
      t.string :book_state
      t.boolean :instore
      t.string :comment
      t.references :library_patron, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
