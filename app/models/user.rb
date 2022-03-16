class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :to_dos,
             dependent: :destroy

  has_many   :summits,
             dependent: :destroy

  has_many   :legends,
             dependent: :destroy

  has_many   :received,
             class_name: "Message",
             foreign_key: "reciever_id",
             dependent: :destroy

  has_many   :sent,
             class_name: "Message",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :interactions,
             class_name: "Comment",
             dependent: :destroy

  # Indirect associations

  has_many   :todos,
             through: :interactions,
             source: :climb

  has_many   :climbs,
             through: :summits,
             source: :climb

  has_many   :climbs_todo,
             through: :to_dos,
             source: :climb

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
