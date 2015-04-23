class AddTotalQuestionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :no_of_questions, :integer
  end
end
