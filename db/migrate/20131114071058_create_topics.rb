class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :content
      t.integer :grade

      t.timestamps
    end
  end
end
