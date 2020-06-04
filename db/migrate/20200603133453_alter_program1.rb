class AlterProgram1 < ActiveRecord::Migration[6.0]
  def up
    change_column_null :programs, :max_number_of_participants, true
  end

  def down
    change_column_null :programs, :max_number_of_participants, false
  end
end
