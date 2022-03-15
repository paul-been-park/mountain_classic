class Region < ApplicationRecord
  # Direct associations

  has_many   :mountains,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    region_name
  end

end
