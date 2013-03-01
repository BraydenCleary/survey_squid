class CreateUserSurveys < ActiveRecord::Migration
  def change
    create_table :user_surveys do |t|
      t.integer :user_id, :null => false
      t.integer :survey_id, :null => false
    end

    add_index(:user_surveys, [:user_id, :survey_id], :unique => true)
  end
end
