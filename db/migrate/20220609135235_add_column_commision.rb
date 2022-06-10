class AddColumnCommision < ActiveRecord::Migration[6.1]
  def change
    add_column :orders,:commision,:float 
  end
end
