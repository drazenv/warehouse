class CreateAssemblies < ActiveRecord::Migration[5.2]
  def change
    create_table :assemblies do |t|
      t.integer :amount_of
      t.references :article, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
