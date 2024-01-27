class AddUsersToBorrowHistory < ActiveRecord::Migration[7.1]
  def change
    add_column :borrow_histories, :user_id, :integer
    add_foreign_key :borrow_histories, :users, column: :user_id
  end
end
