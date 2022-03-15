class Mountain < ApplicationRecord
  # Direct associations

  belongs_to :region

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    region.to_s
  end

end
