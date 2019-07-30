class CreateRepresentationOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :representation_orders do |t|
      t.integer :maat_reference
      t.date :issued_at
      t.references :defendant, foreign_key: true

      t.timestamps
    end
  end
end
