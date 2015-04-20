class AddFieldToExam < ActiveRecord::Migration
  def change
    add_column :exams, :timing, :integer
  end
end
