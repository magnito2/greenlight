class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :uid, index: true
      t.string :name, index: true
      t.timestamps
    end
  end
end
