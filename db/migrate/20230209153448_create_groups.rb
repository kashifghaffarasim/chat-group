class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|

      t.string :name 
      t.string :description 
      t.integer :user_id  

      t.timestamps
    end
  end
end
