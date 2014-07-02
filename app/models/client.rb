class Customer < ActiveRecord::Base
  # client
  has_many :projects
  has_many :assignments,  through: :projects
  has_many :team_members, through: :assignments
  has_many :roles,        through: :assignments

  def gte_proposed_projects
    projects.where("close_probability >= 40")
  end
end
