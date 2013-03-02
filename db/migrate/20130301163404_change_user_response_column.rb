class ChangeUserResponseColumn < ActiveRecord::Migration
  def change
    remove_column :user_responses, :user_id
    add_column    :user_responses,  :user_survey_id, :integer
  end
end
