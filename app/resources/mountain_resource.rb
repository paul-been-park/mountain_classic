class MountainResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :region_id, :integer
  attribute :mountain_name, :string

  # Direct associations

  has_many   :climbs

  belongs_to :region

  # Indirect associations

end
