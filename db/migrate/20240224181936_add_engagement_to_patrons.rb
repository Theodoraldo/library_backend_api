class AddEngagementToPatrons < ActiveRecord::Migration[7.1]
  def change
    add_column :library_patrons, :engagement, :boolean, default: false
  end
end
