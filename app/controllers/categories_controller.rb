class CategoriesController < InheritedResources::Base
  
  respond_to :rdf
  
  # defaults :resource_class => ConceptClass, :collection_name => 'concept_classes', :instance_name => 'concept_class'
  
  
  #def collection
  #  @concept_classes ||= ConceptClass.all
  #end
  
  def index
    
    respond_with do |format|
      format.html
      format.rdf { render :text => "<#{categories_url()}> rdf:type toronto:Collection .", :layout => false, :content_type => "application/rdf+xml" }
    end
    
  end
  
  
  def show
    respond_with do |format|
      format.html
      format.rdf { render :text => "<#{category_url(resource)}> rdf:type rdfs:Class .", :layout => false, :content_type => "application/rdf+xml" }
    end
    
  end
  
  
  
end
