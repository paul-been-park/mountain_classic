class Interaction < ApplicationRecord
  # Direct associations

  belongs_to :climb

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    tick
  end
end
