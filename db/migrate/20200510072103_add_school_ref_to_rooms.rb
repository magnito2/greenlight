class AddSchoolRefToRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :school, foreign_key: true
  end
end
