class CreateSubclassSpecifications < ActiveRecord::Migration
  def up
    create_table :subclass_specifications do |t|

      t.integer :super_category_id
      t.integer :sub_category_id
      
      t.timestamps
    end
  end
  
  def down
    drop_table :subclass_specifications
  end
end
