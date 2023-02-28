class CreateAvatars < ActiveRecord::Migration[6.1]
  
  def down
    drop_table :avatars do |t|
    t.references :user, null: false, foreign_key: true
    t.string :image 
    end
  end 
  def down
    drop_table :avatar 
  end
end
