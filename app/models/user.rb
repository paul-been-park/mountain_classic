class User < ApplicationRecord
  # Direct associations

  has_many   :sent,
             :class_name => "Message",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :ticks,
             :class_name => "Interaction",
             :dependent => :destroy

  has_many   :interactions,
             :class_name => "Comment",
             :dependent => :destroy

  # Indirect associations

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
