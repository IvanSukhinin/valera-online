class CreateWorkCharacteristics < ActiveRecord::Migration[6.1]
  def change
    create_table :work_characteristics do |t|
      t.belongs_to :valera, index: { unique: true }, foreign_key: true
      
      t.integer :mana, default: 50
      t.integer :fatigue, default: 10

      t.timestamps
    end
  end
end
