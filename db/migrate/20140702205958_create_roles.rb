class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.decimal  :standard_rate, precision: 7, scale: 2
      t.timestamps
    end
  end
end
