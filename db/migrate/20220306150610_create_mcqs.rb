class CreateMcqs < ActiveRecord::Migration[6.1]
  def change
    create_table :mcqs do |t|
      t.text :title
      t.references :lesson, foreign_key: true, index: { name: :lesson_index }

      t.timestamps
    end
  end
end
