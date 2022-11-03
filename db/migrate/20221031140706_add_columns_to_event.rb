class AddColumnsToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :eventname, :text
    add_column :events, :eventdesc, :text
  end
end
