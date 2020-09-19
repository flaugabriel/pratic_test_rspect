class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :description
      t.string :control_number
      t.integer :status

      t.timestamps
    end
  end
end
