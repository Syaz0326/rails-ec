# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Maker seed
Maker.create!(name: 'A食品', description: '食品メーカー')
Maker.create!(name: 'B電機', description: '電機メーカー')
Maker.create!(name: 'C化粧品', description: '化粧品メーカー')

# ProductCategory seed
ProductCategory.create!(name: '食品')
ProductCategory.create!(name: '家電')
ProductCategory.create!(name: '化粧品')

# Product seed
20.times do |i|
  Product.create!(name: "商品#{i + 1}",
                  description: "商品#{i + 1}の説明文",
                  maker_id: Maker.find_by(id: i % 3 + 1).id,
                  product_category_id: ProductCategory.find_by(id: i % 3 + 1).id,
                  price: 1000 * (i + 1))
end
