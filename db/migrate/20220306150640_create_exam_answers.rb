class CreateExamAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_answers do |t|
      t.references :exam, foreign_key: true, index: { name: :exam_index }
      t.references :mcq, foreign_key: true, index: { name: :mcq_index }
      t.integer :selected_option, default: 0

      t.timestamps
    end
  end
end
