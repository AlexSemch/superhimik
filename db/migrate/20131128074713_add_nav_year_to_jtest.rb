class AddNavYearToJtest < ActiveRecord::Migration
  def change
    add_column :jtests, :nav_year, :string
  end
end
