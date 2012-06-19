class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|

      t.references :ontology
      
      t.string :identifier
      t.string :label
      t.timestamps
    end
  end
end
