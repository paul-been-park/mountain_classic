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

  # Direct associations

  has_many   :interactions

  has_many   :comments

  has_many   :first_ascents

  belongs_to :mountain

  # Indirect associations

end
