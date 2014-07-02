class TeamMember < ActiveRecord::Base

  # a team member
  has_many :assignments
  has_many :opportunities, through: :assignments
  has_many :roles, through: :assignments
  belongs_to :practice
end
