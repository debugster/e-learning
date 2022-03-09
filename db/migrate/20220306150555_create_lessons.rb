class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.text :title
      t.integer :time_limit, default: 0
      t.references :course, foreign_key: true, index: { name: :course_index }

      t.timestamps
    end
  end
end
