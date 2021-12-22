class Valera < ApplicationRecord
  belongs_to :user, optional: true

  has_one :action_history, dependent: :destroy

  has_one :min_characteristic, dependent: :destroy
  has_one :max_characteristic, dependent: :destroy

  has_one :metro_characteristic, dependent: :destroy
  has_one :sleep_characteristic, dependent: :destroy
  has_one :work_characteristic, dependent: :destroy

  def with_id(user_id)
    create_characteristics
    fill_base_valera user_id
    fill_valera
    set_id_range_characteristic
    set_id_base_characteristic
    save_characteristics
    self
  end

  def create_characteristics
    self.max_characteristic = MaxCharacteristic.new
    self.min_characteristic = MinCharacteristic.new
    self.sleep_characteristic = SleepCharacteristic.new
    self.metro_characteristic = MetroCharacteristic.new
    self.work_characteristic = WorkCharacteristic.new
  end

  def set_id_range_characteristic
    max_characteristic.valera_id = id
    min_characteristic.valera_id = id
  end

  def set_id_base_characteristic
    sleep_characteristic.valera_id = id
    metro_characteristic.valera_id = id
    work_characteristic.valera_id = id
  end

  def save_characteristics
    max_characteristic.save!
    min_characteristic.save!
    sleep_characteristic.save!
    metro_characteristic.save!
    work_characteristic.save!
  end

  def load_range_characteristics
    self.max_characteristic = MaxCharacteristic.where(valera_id: id).first
    self.min_characteristic = MinCharacteristic.where(valera_id: id).first
  end

  def load_base_characteristics
    self.sleep_characteristic = SleepCharacteristic.where(valera_id: id).first
    self.metro_characteristic = MetroCharacteristic.where(valera_id: id).first
    self.work_characteristic = WorkCharacteristic.where(valera_id: id).first
  end

  def fill_base_valera(user_id)
    self.user_id = user_id
    self.health = max_characteristic.health
    self.mana = max_characteristic.mana
  end

  def fill_valera
    self.cheerfulness = max_characteristic.cheerfulness
    self.fatigue = max_characteristic.fatigue
    self.money = max_characteristic.money
  end

  def dead?
    health <= min_characteristic.health ||
      cheerfulness <= min_characteristic.cheerfulness ||
      money <= min_characteristic.money
  end

  def action(action)
    return if can_not_valera_work?(action.name)

    condition_action(action)
    get_valera_tips?(action)
    self.money += action.money
    self.mana += action.mana
    self.fatigue += action.fatigue
    check_base_characteristics
    check_characteristics
  end

  def condition_action(action)
    self.health += action.health unless heal_valera_in_sleep?(action.name)
    self.cheerfulness += action.cheerfulness unless cheerfulness_valera_in_sleep?(action.name)
  end

  def can_not_valera_work?(action_name)
    action_name == 'work' and self.mana >= work_characteristic.mana and self.fatigue >= work_characteristic.fatigue
  end

  def cheerfulness_valera_in_sleep?(action_name)
    action_name == 'sleep' and self.mana < sleep_characteristic.cheerfulness_mana
  end

  def heal_valera_in_sleep?(action_name)
    action_name == 'sleep' and self.mana > sleep_characteristic.heal_mana
  end

  def get_valera_tips?(action)
    if action.name == 'metro' && self.mana >= metro_characteristic.min_mana &&
       self.mana <= metro_characteristic.max_mana
      self.money += metro_characteristic.tips
    end
  end

  def check_base_characteristics
    self.health = [self.health, max_characteristic.health].min
    self.mana = [self.mana, max_characteristic.mana].min
  end

  def check_characteristics
    self.cheerfulness = [self.cheerfulness, max_characteristic.cheerfulness].min
    self.fatigue = [self.fatigue, max_characteristic.fatigue].min
  end
end
