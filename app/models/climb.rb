class Climb < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  has_many   :first_ascents,
             :dependent => :destroy

  belongs_to :mountain

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    route_name
  end

end
