class CreateCodefellowsCourses < ActiveRecord::Migration
  def change
    create_table :codefellows_courses do |t|
      t.string :kind
      t.string :course
      t.string :code
      t.string :section
      t.date :starts_at
      t.date :ends_at
      t.string :instructor

      t.timestamps
    end
  end
end
