class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :s_code
      t.string :s_name
      t.string :s_supp
      t.integer :s_num

      t.timestamps
    end
  end
end
