class CreateFrienndships < ActiveRecord::Migration
  def change
    create_table :frienndships do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
