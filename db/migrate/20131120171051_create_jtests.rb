class CreateJtests < ActiveRecord::Migration
  def change
    create_table :jtests do |t|
      t.integer :survey_id
      t.integer :user_id
      t.float :score

      t.timestamps
    end
  end
end
