class RemoveStackFormUsers < ActiveRecord::Migration
  def change
    remove_column :users, :course, :string
  end
end
