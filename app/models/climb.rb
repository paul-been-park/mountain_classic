class Climb < ApplicationRecord
  # Direct associations

  belongs_to :mountain

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    route_name
  end

end
