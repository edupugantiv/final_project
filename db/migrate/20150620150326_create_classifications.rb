class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.integer :category_id
      t.integer :charity_id
    end
  end
end
