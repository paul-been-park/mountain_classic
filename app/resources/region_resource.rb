class RegionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :region_name, :string

  # Direct associations

  has_many :mountains

  # Indirect associations
end
