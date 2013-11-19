class RenameSurveyType < ActiveRecord::Migration
  def change
    rename_column :surveys, :type, :test_type
  end
end
