class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :message

      t.belongs_to :activity
      t.belongs_to :user
      t.timestamps
    end
  end
end
