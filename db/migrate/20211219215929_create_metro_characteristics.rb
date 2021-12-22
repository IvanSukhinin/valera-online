class CreateMetroCharacteristics < ActiveRecord::Migration[6.1]
  def change
    create_table :metro_characteristics do |t|
      t.belongs_to :valera, index: { unique: true }, foreign_key: true

      t.integer :tips, default: 50
      t.integer :min_mana, default: 40
      t.integer :max_mana, default: 70
      t.timestamps
    end
  end
end
