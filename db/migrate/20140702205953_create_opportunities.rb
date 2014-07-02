class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.references :client
      t.integer :xd_owner
      t.string  :name
      t.decimal :xd_revenue, precision: 12, scale: 2
      t.date :proposed_date
      t.date :rfi_due_date
      t.date :rfp_due_date
      t.date :sow_due_date
      t.date :sse_due_date
      t.date :proposed_date
      t.date :close_date
      t.date :start_date
      t.date :present_date
      t.integer :duration_in_weeks
      t.boolean :proposed_date_set, default: false
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
