class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :category
      t.string :company
      t.string :position
      t.string :website
      t.string :year
      t.string :summary

      t.timestamps null: false
    end
  end
end
