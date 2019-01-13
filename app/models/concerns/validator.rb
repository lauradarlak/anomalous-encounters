class Validator < ActiveModel::Validator
  def validate(record)
      record.errors.add(:display_name, " must contain only numbers, letters, and _")
    end

end
