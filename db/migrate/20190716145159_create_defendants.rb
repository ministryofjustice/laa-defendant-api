class CreateDefendants < ActiveRecord::Migration[5.2]
  def change
    create_table :defendants do |t|
      t.string :last_name
      t.string :first_name
      t.date :date_of_birth

      t.timestamps
    end
  end
end
