class FirstAscent < ApplicationRecord
  # Direct associations

  belongs_to :legend

  belongs_to :climb

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    legend.to_s
  end

end
