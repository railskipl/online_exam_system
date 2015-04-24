class AddStatusToExams < ActiveRecord::Migration
  def change
    add_column :exams, :status, :boolean , :default => true
  end
end
