class AddUrlAndImagesToCharity < ActiveRecord::Migration
  def change
  	add_attachment :charities, :avatar
  	add_column :charities, :url, :string
  end
end
