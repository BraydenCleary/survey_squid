class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :text, :null => false
      t.integer :question_id, :null => false
    end
  end
end
