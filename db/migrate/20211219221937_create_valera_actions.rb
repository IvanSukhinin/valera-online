class CreateValeraActions < ActiveRecord::Migration[6.1]
  def change
    create_table :valera_actions do |t|
      t.string :name
      t.string :description
      t.integer :health
      t.integer :mana
      t.integer :cheerfulness
      t.integer :fatigue
      t.integer :money

      t.timestamps
    end
  end
end
