class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
     t.timestamps null: false
     t.string :name
     t.string :email
     t.string :address
     t.string :phone
     t.boolean :admin, default: false
     t.string :password_digest
     t.string :remember_digest
     t.string :activation_digest
     t.boolean :activated, default: false
     t.datetime :activated_at
     t.string :reset_digest
     t.datetime :reset_sent_at
     
   end
 end
end
