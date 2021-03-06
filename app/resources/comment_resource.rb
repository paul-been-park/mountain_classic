class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :climb_id, :integer
  attribute :comment, :string

  # Direct associations

  belongs_to :climb

  belongs_to :user

  # Indirect associations
end
