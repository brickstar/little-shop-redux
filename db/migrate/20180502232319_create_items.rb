class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :title
      t.text :description
      t.integer :price
      t.text :image # clarify supported data type for image with instructor?
    end
  end
end
