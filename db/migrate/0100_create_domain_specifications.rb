class CreateDomainSpecifications < ActiveRecord::Migration
  def change
    create_table :domain_specifications do |t|

      t.integer :category_id
      t.integer :property_id
      
      t.timestamps
    end
  end
end
