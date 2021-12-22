class CreateValeras < ActiveRecord::Migration[6.1]
  def change
    create_table :valeras do |t|
      t.integer :user_id
      t.integer :health, default: 100
      t.integer :mana, default: 10
      t.integer :cheerfulness, default: 10
      t.integer :fatigue, default: 100
      t.integer :money, default: 100

      t.timestamps
    end
  end
end
