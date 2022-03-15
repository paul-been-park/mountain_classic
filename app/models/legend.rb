class Legend < ApplicationRecord
  mount_base64_uploader :photo, PhotoUploader

  # Direct associations

  has_many   :first_ascents,
             dependent: :destroy

  belongs_to :user,
             optional: true

  # Indirect associations

  has_many   :climbs,
             through: :first_ascents,
             source: :climb

  # Validations

  # Scopes

  def to_s
    name
  end
end
