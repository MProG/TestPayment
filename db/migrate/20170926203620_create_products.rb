class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false, default: 0.0
      t.text :description
      t.string :state, default: "active"

      t.timestamps
    end
  end
end
