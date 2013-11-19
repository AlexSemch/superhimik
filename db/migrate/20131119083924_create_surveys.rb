class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :topic_id
      t.string :name
      t.integer :number_of_quesitons
      t.integer :time_to_complete
      t.string :type

      t.timestamps
    end
  end
end
