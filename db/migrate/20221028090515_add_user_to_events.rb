class AddUserToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :creator, null: false, foreign_key: {to_table: :users}
  end
end
