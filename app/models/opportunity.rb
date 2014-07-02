class Opportunity < ActiveRecord::Base
  # a contractual engagement

  has_paper_trail

  belongs_to :customer
  belongs_to :stage
  belongs_to :business_unit
  belongs_to :xd_owner, class_name: 'User'
  belongs_to :bde, foreign_key: :bde_id, class_name: 'BusinessDevelopmentExecutive'
  belongs_to :gm,  foreign_key: :gm_id,  class_name: 'BusinessDevelopmentExecutive'

  has_many   :assignments
  has_many   :team_members, through: :assignments
  has_many   :roles, through: :assignments
  has_many   :notes

  has_one :qualification
  has_one :scorecard, through: :qualification

  accepts_nested_attributes_for :notes
  accepts_nested_attributes_for :assignments


  validates_presence_of :name


  scope :eligible, lambda { not_trashed.where("close_probability BETWEEN 40 AND 90") }
  scope :ready_to_close, lambda { not_trashed.where("close_probability BETWEEN 70 AND 90") }
  scope :closed, lambda { not_trashed.where("projects.close_probability < 5 OR projects.close_probability > 90") }
  scope :active, lambda { not_trashed.where(active: true).where("projects.close_probability BETWEEN 5 AND 90") } # inclusive
  scope :inactive, lambda { not_trashed.where(active: false) }
  scope :trashed, lambda { where(trashed: true) }
  scope :not_trashed, lambda { where(trashed: false) }
  scope :with_stage, lambda { where("stage_id IS NOT NULL") }

  scope :with_events_for_date, lambda {|date|
    active.where("rfi_due_date = ? OR rfp_due_date = ? OR sow_due_date = ? OR sse_due_date = ? OR present_date = ?", date, date, date, date, date)
  }

  scope :in_stage, lambda {|stage|
    if stage.name == "Proposed"
      in_proposed_stage
    else
      where(stage: stage)
    end
  }

  scope :not_needing_update, lambda {|threshold|
    where("updated_at > ?", threshold)
  }
  scope :needing_update, lambda {|threshold|
    where("updated_at < ?", threshold)
  }

  scope :in_proposed_stage, lambda { where(stage_id: Stage.less_proposed.map(&:id)) }

  scope :with_proposed_date, lambda { where("proposed_date IS NOT NULL").where(proposed_date_set: true) }

  def self.current_close_rate
    opps = self.select(:id, :stage_id)
    closed_won_opps_count = opps.where(stage: Stage.find_by(name: 'Closed/Won')).count.to_f
    all_closed_opps_count = opps.closed.count.to_f
    quotient = closed_won_opps_count / all_closed_opps_count
  end

  def self.cash_value opps, stage
    if stage.default_percentage >= 40
      opportunity_set = stage.persisted? ? opps.in_stage(stage) : opps.in_proposed_stage
      result = opportunity_set.inject(0){|sum,opp| sum + (opp.xd_revenue || 0)}
      output = result == 0 ? nil : result
    else
      nil
    end
  end

  def self.events_for_date date
    project_set = Project.with_events_for_date(date)
    events_for_date = []
    project_set.each do |project|
      %w[rfi rfp sow sse].each do |doc|
        col = project.send("#{doc}_due_date")
        if col.present? && col == date
          events_for_date.push({
            item_due: doc,
            title: doc.upcase,
            project: project
          })
        end
      end
      if project.present_date.present? && project.present_date == date
        events_for_date.push({
          item_due: 'present',
          title: 'Present',
          project: project
        })
      end
    end
    events_for_date
  end
end
