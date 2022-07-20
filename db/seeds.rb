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
                  price: 1000 * (i + 1),
                  image_path: "/product_images/product#{i + 1}.png"
                 )
end

# Review_tags seed
ReviewTag.create!(name: 'design', label: 'デザイン')
ReviewTag.create!(name: 'usability', label: '使い勝手')
ReviewTag.create!(name: 'component', label: '成分')
ReviewTag.create!(name: 'price', label: '価格')
ReviewTag.create!(name: 'manual', label: '説明書')

# Review seed
30.times do |i|
  review = Review.create!(product_id: rand(20) + 1,
                          comment: "コメント#{i + 1}",
                          reviewer_name: "レビュワー#{i + 1}",
                          price_score: rand(5) + 1,
                          design_score: rand(5) + 1,
                          quality_score: rand(5) + 1)
  tag_count = rand(5) + 1
  tag_id = rand(5) + 1
  tag_count.times do |i|
    ReviewTagMap.create!(review_id: review.id,
                         review_tag_id: tag_id)
    tag_id += 1
    if tag_id > 5
      tag_id = 1
    end
  end
end
