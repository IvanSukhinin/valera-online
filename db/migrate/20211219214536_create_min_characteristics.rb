class CreateMinCharacteristics < ActiveRecord::Migration[6.1]
  def change
    create_table :min_characteristics do |t|
      t.belongs_to :valera, index: { unique: true }, foreign_key: true
      t.integer :health, default: 0
      t.integer :mana, default: 0
      t.integer :cheerfulness, default: -10
      t.integer :fatigue, default: 0
      t.integer :money, default: -500

      t.timestamps
    end
  end
end
