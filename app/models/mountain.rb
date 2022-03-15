class Mountain < ApplicationRecord
  # Direct associations

  has_many   :climbs,
             dependent: :destroy

  belongs_to :region

  # Indirect associations

  # Validations

  validates :mountain_name, presence: true

  # Scopes

  def to_s
    region.to_s
  end
end
