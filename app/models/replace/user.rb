class User < ActiveRecord::Base

  # has_secure_password

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # DM: :registerable, :recoverable
  devise :database_authenticatable, :trackable, :validatable, :registerable
         #:rememberable, #:recoverable,

  has_many :owned_projects, foreign_key: :xd_owner_id, class_name: 'Project'

  def self.clearance_name clearance
    case clearance
    when 1 then 'Admin'   # Can do everything
    when 2 then 'Creator' # Can do everything except what is found in the admin tab
    when 3 then 'Viewer'    # Can't create or update anything, but can view anything
    end
  end

  def can_admin?
    clearance <= 1
  end

  def can_create?
    clearance <= 2
  end

  def can_view?
    clearance <= 3
  end
  
end
