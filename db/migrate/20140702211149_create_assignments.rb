class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer    :assigner_id
      t.references :team_member_id
      t.references :opportunity_id
      t.references :role_id
      t.float      :rate
      t.float      :hours
      t.integer    :start_week
      t.integer    :start_date
      t.timestamps
    end
  end
end
