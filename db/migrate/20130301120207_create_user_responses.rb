class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :users_responses do |t|
      t.integer :user_id, :null => false
      t.integer :response_id, :null => false
      t.integer :question_id, :null => false
    end
    add_index(:accounts, [:user_id, :response_id, :question_id], :unique => true)
  end
end
