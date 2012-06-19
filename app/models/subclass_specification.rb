class SubclassSpecification < ActiveRecord::Base
  
  belongs_to :super_category, :class_name => "Category", :foreign_key => :super_category_id
  belongs_to :sub_category,   :class_name => "Category", :foreign_key => :sub_category_id
  
end
