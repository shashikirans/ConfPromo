class AddColumnToUanswer < ActiveRecord::Migration
  def change
    add_column :uanswers, :result, :boolean
  end
end
