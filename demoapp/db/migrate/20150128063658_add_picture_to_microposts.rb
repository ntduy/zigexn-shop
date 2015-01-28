class AddPictureToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :pictrure, :string
  end
end
