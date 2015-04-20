class AddStarttimeToExam < ActiveRecord::Migration
  def change
    add_column :exams, :starttime, :datetime
  end
end
