class CreateSystems < ActiveRecord::Migration
 
  def change
    create_table :systems do |t|
      t.string :name
      t.text :description
      t.string :tag
      t.timestamps null: false
    end

    add_index :systems, :tag,                unique: true

  end
end
