class CreateTheories < ActiveRecord::Migration
  def change
    create_table :theories do |t|
      t.integer :topic_id
      t.string :name
      t.text :theory_text

      t.timestamps
    end
  end
end
