class Assignment < ActiveRecord::Base

  has_paper_trail

  # join table - team member to project
  belongs_to :team_member
  belongs_to :project
  has_one :customer, through: :project
  belongs_to :role
  belongs_to :assigner, foreign_key: :assigner_id, class_name: 'User'

  def calculate_start_date
    project.start_date + (start_week - 1).weeks rescue nil
  end

end
