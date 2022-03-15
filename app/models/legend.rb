class Legend < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :required => false

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
