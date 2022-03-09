class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.references :user, foreign_key: true, index: { name: :user_index }
      t.references :lesson, foreign_key: true, index: { name: :lesson_index }

      t.timestamps
    end
  end
end
