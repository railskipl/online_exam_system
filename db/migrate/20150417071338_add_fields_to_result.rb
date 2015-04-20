class AddFieldsToResult < ActiveRecord::Migration
  def change
    add_column :results, :exam_id, :integer
  end
end
