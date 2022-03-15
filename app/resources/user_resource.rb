class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string

  # Direct associations

  has_many   :legends

  has_many   :received,
             resource: MessageResource,
             foreign_key: :reciever_id

  has_many   :sent,
             resource: MessageResource,
             foreign_key: :sender_id

  has_many   :ticks,
             resource: InteractionResource

  has_many   :interactions,
             resource: CommentResource

  # Indirect associations

  many_to_many :climb_interactions,
               resource: ClimbResource
end
