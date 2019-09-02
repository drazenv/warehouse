class Article < ApplicationRecord
  has_many :assemblies

  validates :name, presence: true
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.import_articles(items)
    items["inventory"].each do |article_to_import|
      article = Article.find_by(id: article_to_import["art_id"])
      if article.nil?
        Article.create(name: article_to_import["name"], id: article_to_import["art_id"], stock: article_to_import["stock"])
      else
        article.update(name: article_to_import["name"], stock: article_to_import["stock"])
      end
    end
  end
end
