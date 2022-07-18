class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :product, null: false, foreign_key: true
      t.string :comment
      t.string :reviewer_name
      t.integer :price_score
      t.integer :design_score
      t.integer :quality_score

      t.timestamps
    end
  end
end
