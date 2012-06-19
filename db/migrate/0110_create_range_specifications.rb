class CreateRangeSpecifications < ActiveRecord::Migration
  def change
    create_table :range_specifications do |t|

      t.integer :category_id
      t.integer :property_id
      
      t.timestamps
    end
  end
end
