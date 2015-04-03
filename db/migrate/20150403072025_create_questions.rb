class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :exam_id
      t.text :content

      t.timestamps null: false
    end
  end
end
