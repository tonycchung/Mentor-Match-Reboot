class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :position, :string
    add_column :users, :graduating_class, :string
    add_column :users, :course, :string
  end
end
