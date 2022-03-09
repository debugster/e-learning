class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :code
      t.text :title

      t.timestamps
    end
  end
end
