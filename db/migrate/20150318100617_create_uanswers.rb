class CreateUanswers < ActiveRecord::Migration
  def change
    create_table :uanswers do |t|
      t.integer :choosen_answer
      t.references :user, index: true
      t.references :question, index: true

      t.timestamps null: false
    end
    add_foreign_key :uanswers, :users
    add_foreign_key :uanswers, :questions
  end
end
