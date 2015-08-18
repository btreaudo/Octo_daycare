class Owner < ActiveRecord::Base
  has_many :octopi

  def lastfirst
    "#{last_name}, #{first_name}"
  end
end
