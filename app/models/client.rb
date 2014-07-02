class Customer < ActiveRecord::Base
  # client
  has_many :opportunities
  has_many :assignments,  through: :opportunities
  has_many :team_members, through: :assignments
  has_many :roles,        through: :assignments

end
