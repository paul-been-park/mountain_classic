class InteractionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :tick, :string
  attribute :summited, :string
  attribute :user_id, :integer
  attribute :climb_id, :integer

  # Direct associations

  belongs_to :climb

  belongs_to :user

  # Indirect associations
end
