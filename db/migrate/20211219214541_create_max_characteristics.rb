class CreateMaxCharacteristics < ActiveRecord::Migration[6.1]
  def change
    create_table :max_characteristics do |t|
      t.belongs_to :valera, index: { unique: true }, foreign_key: true
      t.integer :health, default: 100
      t.integer :mana, default: 100
      t.integer :cheerfulness, default: 10
      t.integer :fatigue, default: 100
      t.integer :money, default: 100

      t.timestamps
    end
  end
end
