class AddSlugToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :slug, :string
    add_index  :users, :slug
  end
end
