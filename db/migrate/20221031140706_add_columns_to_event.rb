class AddColumnsToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :eventname, :string
    add_column :events, :eventdesc, :text
  end
end
