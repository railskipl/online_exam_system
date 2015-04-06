class AddExamIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :exam_id, :integer
  end
end
