class AddIndexToUsersNik < ActiveRecord::Migration
  def change
  	add_index :users, :nik, unique: true
  end
end
