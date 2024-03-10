class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name, nul: false
      t.text :item_describe, nul: false
      t.integer :category_id, nul: false
      t.integer :condition_id, nul: false
      t.integer :send_cost_id, nul: false
      t.integer :prefcture_id, nul: false
      t.integer :arrive_day_id, nul: false
      t.integer :price, nul: false
      t.references :user, nul: false, foreign_key: true
      t.timestamps
    end
  end
end
