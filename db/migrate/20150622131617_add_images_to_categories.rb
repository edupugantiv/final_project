class AddImagesToCategories < ActiveRecord::Migration
  def change
  	add_attachment :categories, :avatar
  end
end
