class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title,       null: false
      t.integer :price,      null: false
      t.text :material,      null: false
      t.text :body,          null: false
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
