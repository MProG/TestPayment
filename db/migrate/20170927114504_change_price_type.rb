class ChangePriceType < ActiveRecord::Migration[5.1]
  def change
  	change_table :products do |t|
      t.change :price, :integer, null: false, default: 0
    end
  end
end
