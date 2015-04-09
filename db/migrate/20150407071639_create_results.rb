class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :question_id
      t.integer :answer_id
      t.integer :userchoice_id

      t.timestamps null: false
    end
  end
end
