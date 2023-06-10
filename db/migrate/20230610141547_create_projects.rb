class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.integer :cost_type
      t.string :set_token
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
