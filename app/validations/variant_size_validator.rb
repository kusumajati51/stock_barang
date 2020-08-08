class VariantSizeValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        if value = nil
            record.errors.add(attribute, "must exist")
        end    
    end
end