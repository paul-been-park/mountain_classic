class Legend < ApplicationRecord
  # Direct associations

  has_many   :first_ascents,
             dependent: :destroy

  belongs_to :user,
             optional: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
