class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :system_name
      t.string :nav_year
      t.string :footer
      t.text :about_as
      t.text :contact_as

      t.timestamps
    end
  add_index :settings, :system_name, unique: true
  end
end
