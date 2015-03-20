class CreateQchoices < ActiveRecord::Migration
  def change
    create_table :qchoices do |t|
      t.integer :qoption_id
      t.string :qoption_text
      t.references :question, index: true

      t.timestamps null: false
    end
    add_foreign_key :qchoices, :questions
  end
end
