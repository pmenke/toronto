class DomainSpecification < ActiveRecord::Base
  
  belongs_to :category
  belongs_to :property
  
end
