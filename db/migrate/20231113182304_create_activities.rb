class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :external_id
      t.belongs_to :user
      t.float :total_distance
      t.float :average_speed
      t.float :total_time

      t.timestamps
    end
  end
end
