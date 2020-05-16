class AddImageToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :pic1, :string
    add_column :products, :pic2, :string
    add_column :products, :pic3, :string
  end
end
