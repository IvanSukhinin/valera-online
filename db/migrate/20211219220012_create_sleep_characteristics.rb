class CreateSleepCharacteristics < ActiveRecord::Migration[6.1]
  def change
    create_table :sleep_characteristics do |t|
      t.belongs_to :valera, index: { unique: true }, foreign_key: true

      t.integer :heal_mana, default: 30
      t.integer :cheerfulness_mana, default: 70

      t.timestamps
    end
  end
end
