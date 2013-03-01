class AddCountColumnToResponses < ActiveRecord::Migration
  def change
    add_column :reponses, :count
  end
end
