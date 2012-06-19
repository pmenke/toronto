class Category < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :identifier
  
  belongs_to :ontology
  
  has_many :domain_specifications
  has_many :range_specifications
  
  has_many :subclass_specs,   :class_name => "SubclassSpecification", :foreign_key => "super_category_id"
  has_many :superclass_specs, :class_name => "SubclassSpecification", :foreign_key => "sub_category_id"
  
  has_many :sub_classes,   :class_name => "Category", :through => :subclass_specs,   :source => :sub_category
  has_many :super_classes, :class_name => "Category", :through => :superclass_specs, :source => :super_category
  
  has_many :comments, as: :comment_subject
  
end
