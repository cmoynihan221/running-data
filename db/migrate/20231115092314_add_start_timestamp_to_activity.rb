class AddStartTimestampToActivity < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :start_time, :timestamp
  end
end
