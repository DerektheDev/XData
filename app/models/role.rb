class Role < ActiveRecord::Base
  # a list of potential utilizations/areas of focus on a project, per team member
  has_many :assignments
  has_many :team_members, through: :assignments
  has_many :projects, through: :assignments

  def hours project_set
    assignments.where(project_id: project_set.map(&:id)).map{|a| a.hours || 0}.sum.round
  end
end
