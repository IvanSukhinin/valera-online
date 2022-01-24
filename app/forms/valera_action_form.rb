class ValeraActionForm
  include ActiveModel::Model
  include Virtus

  attribute :name, String
  attribute :description, String
  attribute :health, Integer
  attribute :mana, Integer
  attribute :cheerfulness, Integer
  attribute :fatigue, Integer
  attribute :money, Integer

  validates :name, presence: true
  validates :description, presence: true
  validates :health,
            numericality: { only_integer: true, lower_than: MaxCharacteristic.first.health,
                            greater_than: -MaxCharacteristic.first.health }
  validates :mana,
            numericality: { only_integer: true, lower_than: MaxCharacteristic.first.mana,
                            greater_than: -MaxCharacteristic.first.mana }
  validates :cheerfulness,
            numericality: { only_integer: true, lower_than: MaxCharacteristic.first.cheerfulness,
                            greater_than: MinCharacteristic.first.cheerfulness }
  validates :fatigue,
            numericality: { only_integer: true, lower_than: MaxCharacteristic.first.fatigue,
                            greater_than: -MaxCharacteristic.first.fatigue }
  validates :money, numericality: { only_integer: true }

  def save
    return false unless valid?

    persist!
    true
  end

  private

  def persist!
    ValeraAction.create!(name: name, description: description, health: health, mana: mana,
                         cheerfulness: cheerfulness, fatigue: fatigue, money: money)
  end
end
