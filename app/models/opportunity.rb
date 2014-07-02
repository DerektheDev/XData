class Opportunity < ActiveRecord::Base
  # a contractual engagement

  has_paper_trail
  
  validates_presence_of :name

  belongs_to :client
  has_many   :assignments
  has_many   :team_members, through: :assignments
  has_many   :roles, through: :assignments

end
