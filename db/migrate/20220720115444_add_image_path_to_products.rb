class AddImagePathToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :image_path, :string
  end
end
