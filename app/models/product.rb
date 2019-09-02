class Product < ApplicationRecord
  has_many :assemblies
  has_many :articles, through: :assemblies

  validates :name, presence: true

  def quantity
    quantity = []
    self.assemblies.each do |assembly|
      quantity << (Article.find(assembly.article_id).stock / assembly.amount_of).truncate
    end
    quantity.min
  end

  def self.import_products(items)
    items["products"].each do |product_to_import|
      product = Product.find_by(name: product_to_import["name"])

      if product.nil?
        product = Product.create(name: product_to_import["name"])
        product_to_import["contain_articles"].each do |article_to_import|
          article = Article.find(article_to_import["art_id"])
          Assembly.create!(amount_of: article_to_import["amount_of"], article_id: article.id, product_id: product.id)
        end
      else
        product_to_import["contain_articles"].each do |article_to_import|
          assembly_item = Assembly.find_by(article_id: article_to_import["art_id"], product_id: product.id)
          assembly_item.update(amount_of: article_to_import["amount_of"])
        end
      end
    end
  end

end
