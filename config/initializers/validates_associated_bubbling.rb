module ActiveRecord
    module Validations 
        class AssociatedValidator < ActiveModel::EachValidator
            def validate_each(record, attribute, value)
                ((value.kind_of?(Enumerable) || value.kind_of?(ActiveRecord::Relation)) ? value :[value]).each do |v|
                    unless v.valid?
                        v.errors.each do |attr, error|
                            record.errors.add(attribute, "#{attr} #{error}", options.merge(:value => value))
                        end
                    end
                end
            end 
        end
        module ClassMethods
            def validates_associated_bubbling(*attr_names)
              validates_with AssociatedValidator, _merge_attributes(attr_names)
            end
        end
    end
end
