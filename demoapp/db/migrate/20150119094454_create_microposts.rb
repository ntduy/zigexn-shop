class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.text :content
      t.string :user_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
