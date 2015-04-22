class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :no_of_correct_answer, :integer
    add_column :users, :percent, :integer
  end
end
