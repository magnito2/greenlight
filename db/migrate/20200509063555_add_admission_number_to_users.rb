class AddAdmissionNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admission_number, :string
  end
end
