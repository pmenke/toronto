class Comment < ActiveRecord::Base
  
  belongs_to :comment_subject, :polymorphic => true 
  
end
