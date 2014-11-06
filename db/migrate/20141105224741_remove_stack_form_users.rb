class RemoveStackFormUsers < ActiveRecord::Migration
  def change
    remove_column :users, :stack, :string
  end
end
