class CreateReviewTagMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :review_tag_maps do |t|
      t.references :review, null: false, foreign_key: true
      t.references :review_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
