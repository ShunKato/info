class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :p_code
      t.string :p_name
      t.string :cust
      t.string :supp
      t.text :comment

      t.timestamps
    end
  end
end
