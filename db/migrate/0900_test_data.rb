# encoding: utf-8

class TestData < ActiveRecord::Migration
  
  def up
    ontoF = YAML::load( File.open(File.join(Rails.root, 'db', 'ontologies', 'eorath.yml' )))
    ontoDat = ontoF["ontology"]
    o = Ontology.create identifier: ontoDat['identifier'], label: ontoDat['label']
    o.comments.create language: ontoDat['comment']['language'], comment_body: ontoDat['comment']['text']
    
    ontoDat['categories'].each do |catEntry|
      c = Category.create ontology: o, identifier: catEntry['identifier'], label: catEntry['label']
      c.comments.create language: catEntry['comment']['language'], comment_body: catEntry['comment']['text']
    end
    
    ontoDat['properties'].each do |propEntry|
      p = Property.create ontology: o, identifier: propEntry['identifier'], label: propEntry['label']
      if propEntry['domains']
        propEntry['domains'].each do |d| 
          p.domain_specifications.create category: Category.find(d)
        end
      end
    end
    
    # cats = Array.new
    # cats << %w(continent Continent)
    # cats << %w(region Region)
    # cats << %w(place Place)
    # cats << %w(race Race)
    # cats << %w(profession Profession)
    # cats << %w(character Character)
    # cats << %w(hero Hero)
    # 
    # cats.each do |c|
    #   Category.create ontology: o, identifier: c[0], label: c[1]
    # end
    # 
    # SubclassSpecification.create super_category: Category.find('character'), sub_category: Category.find('hero')

    # Multimodality
    # idoC = Category.create ontology: o, identifier: 'identifiableObject', label: 'IdentifiableObject'
    # docC = Category.create ontology: o, identifier: 'toeDocument',        label: 'Corpus'
    # desC = Category.create ontology: o, identifier: 'design',             label: 'Design'
    # dscC = Category.create ontology: o, identifier: 'designComponent',    label: 'DesignComponent'
    # triC = Category.create ontology: o, identifier: 'trial',              label: 'Trial'
    # resC = Category.create ontology: o, identifier: 'resource',           label: 'Resource'
    # rspC = Category.create ontology: o, identifier: 'resourcePart',       label: 'ResourcePart'
    # strC = Category.create ontology: o, identifier: 'string',             label: 'String'
    # intC = Category.create ontology: o, identifier: 'integer',            label: 'Integer'
    # floC = Category.create ontology: o, identifier: 'float',              label: 'Float'
    # lstC = Category.create ontology: o, identifier: 'list',               label: 'List'
    # mapC = Category.create ontology: o, identifier: 'map',                label: 'Map'
    # shoP = Property.create ontology: o, identifier: 'shortTitle',         label: 'ShortTitle'
    # titP = Property.create ontology: o, identifier: 'title',              label: 'Title'
    # ideP = Property.create ontology: o, identifier: 'id',                 label: 'Identifier'
    # lsmP = Property.create ontology: o, identifier: 'listMember',         label: 'ListMember'
    # mpmP = Property.create ontology: o, identifier: 'mapMember',          label: 'MapMember'
    # 
    # DomainSpecification.create category: docC, property: shoP
    # DomainSpecification.create category: docC, property: titP
    # DomainSpecification.create category: idoC, property: ideP
    # DomainSpecification.create category: lstC, property: lsmP
    # 
    # RangeSpecification.create category: strC, property: shoP
    # RangeSpecification.create category: strC, property: titP
    # RangeSpecification.create category: strC, property: ideP
    # RangeSpecification.create category: strC, property: lsmP
    # RangeSpecification.create category: intC, property: lsmP
    # RangeSpecification.create category: floC, property: lsmP
    # RangeSpecification.create category: lstC, property: lsmP
    # RangeSpecification.create category: mapC, property: lsmP
    # 
    # SubclassSpecification.create super_category_id: idoC.id, sub_category_id: docC.id
    # SubclassSpecification.create super_category_id: idoC.id, sub_category_id: desC.id
    # SubclassSpecification.create super_category_id: idoC.id, sub_category_id: dscC.id
    # SubclassSpecification.create super_category_id: idoC.id, sub_category_id: triC.id
    # SubclassSpecification.create super_category_id: idoC.id, sub_category_id: resC.id
    # SubclassSpecification.create super_category_id: idoC.id, sub_category_id: rspC.id
    
  end

  def down
    
  end
  
end
