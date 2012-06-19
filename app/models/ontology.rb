class Ontology < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :identifier
  
  has_many :categories
  has_many :properties
  
  has_many :comments, as: :comment_subject
  
end
