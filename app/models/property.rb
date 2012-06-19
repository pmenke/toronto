class Property < ActiveRecord::Base

  extend FriendlyId
  friendly_id :identifier
  
  belongs_to :ontology
  
  has_many :domain_specifications
  has_many :range_specifications
  
  has_many :comments, as: :comment_subject
  
end
