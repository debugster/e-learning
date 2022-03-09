class CreateMcqOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :mcq_options do |t|
      t.text :title
      t.boolean :correct, default: false
      t.references :mcq, foreign_key: true, index: { name: :mcq_index }

      t.timestamps
    end
  end
end
