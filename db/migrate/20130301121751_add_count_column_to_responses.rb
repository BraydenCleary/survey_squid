class AddCountColumnToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :count, :integer, :default => 0
  end
end
