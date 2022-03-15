class MessageResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :sender_id, :integer
  attribute :reciever_id, :integer
  attribute :content, :string

  # Direct associations

  belongs_to :reciever,
             resource: UserResource

  belongs_to :sender,
             resource: UserResource

  # Indirect associations

end
