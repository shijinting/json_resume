class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|

      t.timestamps null: false
    end
  end
end
