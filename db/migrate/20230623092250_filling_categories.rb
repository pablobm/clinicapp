class FillingCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :name, :string, index: {unique: true}
    add_reference :doctors, :category, index: true, foreign_key: true
    
  end
end
