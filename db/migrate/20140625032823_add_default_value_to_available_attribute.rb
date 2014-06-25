class AddDefaultValueToAvailableAttribute < ActiveRecord::Migration
  def up
    change_column :users, :available, :boolean, :default => true
  end

  def down
    change_column :users, :available, :boolean, :default => nil
  end
end
