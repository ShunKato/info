class AddProductIdToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :product_id, :string
  end
end
