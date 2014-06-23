class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :background
      t.text :accomplishments
      t.text :professional_summary
      t.text :personal_statement
      t.string :role
      t.boolean :admin

      t.timestamps
    end
  end
end
