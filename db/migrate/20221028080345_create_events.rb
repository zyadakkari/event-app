class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :eventdate

      t.timestamps
    end
  end
end
