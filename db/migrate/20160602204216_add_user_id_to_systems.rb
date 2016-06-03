class AddUserIdToSystems < ActiveRecord::Migration
  def change
    add_column :systems, :uid, :integer
  end
end
