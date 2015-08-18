class CreateOctopi < ActiveRecord::Migration
  def change
    create_table :octopi do |t|
      t.string :name
      t.references :owner, index: true, foreign_key: true
      t.references :breed, index: true, foreign_key: true
      t.date :dob
      t.string :vet_name
      t.string :vet_phone
      t.boolean :in_daycare

      t.timestamps null: false
    end
  end
end
