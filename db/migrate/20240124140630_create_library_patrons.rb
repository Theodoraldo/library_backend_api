class CreateLibraryPatrons < ActiveRecord::Migration[7.1]
  def change
    create_table :library_patrons do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.text :contact
      t.string :location
      t.string :city
      t.string :state
      t.string :identity_card
      t.string :identity_no
      t.string :address

      t.timestamps
    end
  end
end
