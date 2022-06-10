
class AddColumnFullname < ActiveRecord::Migration[6.1]
  def change
    add_column :orders,:fullname,:string 
  end
end

