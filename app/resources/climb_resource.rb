class ClimbResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :route_name, :string
  attribute :length, :string
  attribute :grade, :string
  attribute :guide_url, :string
  attribute :climb_photo, :string
  attribute :mountain_id, :integer
  attribute :description, :string
  attribute :classic, :string
  attribute :location, :string

  # Direct associations

  has_many   :interactions

  has_many   :comments

  has_many   :first_ascents

  belongs_to :mountain

  # Indirect associations

  many_to_many :users_interactions,
               resource: UserResource

  many_to_many :legends
end
