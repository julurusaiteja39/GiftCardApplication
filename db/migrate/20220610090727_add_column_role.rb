class AddColumnRole < ActiveRecord::Migration[6.1]
  def change
    add_column :users,:role1,:integer 
  end
end
