class TeamMember < ActiveRecord::Base

  # a team member
  has_many :assignments
  has_many :projects, through: :assignments
  has_many :roles, through: :assignments
  belongs_to :business_unit
  belongs_to :practice
  has_many :notes
end
