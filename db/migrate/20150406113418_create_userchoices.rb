class CreateUserchoices < ActiveRecord::Migration
  def change
    create_table :userchoices do |t|
      t.integer :user_id
      t.integer :exam_id

      t.timestamps null: false
    end
  end
end
