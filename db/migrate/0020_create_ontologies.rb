class CreateOntologies < ActiveRecord::Migration
  def change
    create_table :ontologies do |t|

      t.string :identifier
      t.string :label
      
      t.timestamps
    end
  end
end
