class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :action
      t.string :event_user_name
      t.string :event_type
      t.integer :event_user_id
      t.integer :event_id
      t.integer :event_number

      t.timestamps
    end
  end
end
