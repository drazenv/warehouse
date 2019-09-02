require 'json'

# filepath = '/home/drazh/Downloads/inventory.json'
# articles = JSON.parse(File.read(filepath))

# articles["inventory"].each do |article_item|
#   Article.create(name: article_item["name"], id: article_item["art_id"], stock: article_item["stock"])
# end


# filepath = '/home/drazh/Downloads/products.json'
# products = JSON.parse(File.read(filepath))

# products["products"].each do |products_item|
#   current_product = Product.create(name: products_item["name"])

#   products_item["contain_articles"].each do |article_item|
#     current_article = Article.find(article_item["art_id"])
#     Assembly.create!(amount_of: article_item["amount_of"], article_id: current_article.id, product_id: current_product.id)
#   end
# end


Assembly.delete_all
Product.delete_all
# Assembly.new(amount_of: 3)
# Assembly.article = Article.find(1)
# Assembly.product = Product.find(13)
# Assembly.save!
