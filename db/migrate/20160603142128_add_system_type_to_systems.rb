class AddSystemTypeToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :system_type, :string
  end
end
