class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :test_id
      t.text :content

      t.timestamps null: false
    end
  end
end
