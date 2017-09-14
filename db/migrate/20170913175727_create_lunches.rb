class CreateLunches < ActiveRecord::Migration[5.1]
  def change
    create_table :lunches do |t|

      t.timestamps
    end
  end
end
