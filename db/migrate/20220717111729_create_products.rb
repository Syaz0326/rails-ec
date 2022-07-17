class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :maker, null: false, foreign_key: true
      t.references :product_category, null: false, foreign_key: true
      t.string :name, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
