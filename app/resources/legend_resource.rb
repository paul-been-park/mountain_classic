class LegendResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :photo, :string
  attribute :bio, :string
  attribute :user_id, :integer

  # Direct associations

  has_many   :first_ascents

  belongs_to :user

  # Indirect associations
end
