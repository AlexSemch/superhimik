class CreateDimages < ActiveRecord::Migration
  def change
    create_table :dimages do |t|
      t.attachment :fotka
      t.string :flag
      t.text :descr

      t.timestamps
    end
  end
end
