class FirstAscentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :legend_id, :integer
  attribute :climb_id, :integer

  # Direct associations

  # Indirect associations

end