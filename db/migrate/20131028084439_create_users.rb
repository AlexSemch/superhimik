class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nik
      t.string :pip
      t.string :password_digest
      t.boolean :admin, default: false
      t.integer :grade

      t.timestamps
    end
  end
end
