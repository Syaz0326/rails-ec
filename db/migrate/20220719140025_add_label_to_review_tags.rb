class AddLabelToReviewTags < ActiveRecord::Migration[6.1]
  def change
    add_column :review_tags, :label, :string
  end
end
