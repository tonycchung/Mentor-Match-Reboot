class AddTechnologiesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :technologies, :text
  end
end
