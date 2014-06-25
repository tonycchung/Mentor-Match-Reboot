class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :position, :string
    add_column :users, :graduating_class, :string
    add_column :users, :stack, :string
  end
end
