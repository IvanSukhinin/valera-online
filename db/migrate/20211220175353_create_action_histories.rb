class CreateActionHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :action_histories do |t|
      t.belongs_to :valera, foreign_key: true
      t.belongs_to :valera_action, foreign_key: true
      t.timestamps
    end
  end
end
