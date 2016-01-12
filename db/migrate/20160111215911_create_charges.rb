class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :role
      t.timestamps null: false
    end
  end
end
