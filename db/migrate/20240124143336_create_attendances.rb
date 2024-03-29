class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.references :library_patron, null: false, foreign_key: true

      t.timestamps
    end
  end
end
