class ToDo < ApplicationRecord
  # Direct associations

  belongs_to :climb

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
