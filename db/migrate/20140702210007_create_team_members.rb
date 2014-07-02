class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.references :practice
      t.string :name
      t.timestamps
    end
  end
end
