class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.integer :comment_subject_id
      t.string :comment_subject_type
      
      t.string :language
      t.text :comment_body

      t.timestamps
    end
  end
end
