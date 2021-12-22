class ValeraController < ApplicationController
  def index
    @valera = Valera.where(user_id: current_user.id).first
    @actions = ValeraAction.all()
    unless @valera then
      create_valera
      create_characteristics
    else 
      find_characteristics
    end

    self.image_name
  end

  def create_valera
      @valera = Valera.new
      fill_valera
      @valera.save
  end

  def create_characteristics
    @max_characteristic = MaxCharacteristic.new
    @min_characteristic = MinCharacteristic.new

    @sleep_characteristic = SleepCharacteristic.new
    @metro_characteristic = MetroCharacteristic.new
    @work_characteristic = WorkCharacteristic.new

    @max_characteristic.valera_id = @valera.id
    @min_characteristic.valera_id = @valera.id

    @sleep_characteristic.valera_id = @valera.id
    @metro_characteristic.valera_id = @valera.id
    @work_characteristic.valera_id = @valera.id

    @max_characteristic.save
    @min_characteristic.save

    @sleep_characteristic.save
    @metro_characteristic.save
    @work_characteristic.save
  end

  def find_characteristics
    @max_characteristic = MaxCharacteristic.where(valera_id: @valera.id).first
    @min_characteristic = MinCharacteristic.where(valera_id: @valera.id).first

    @sleep_characteristic = SleepCharacteristic.where(valera_id: @valera.id).first
    @metro_characteristic = MetroCharacteristic.where(valera_id: @valera.id).first
    @work_characteristic = WorkCharacteristic.where(valera_id: @valera.id).first
  end

  def fill_valera
    @valera.user_id = current_user.id
    @valera.health = @max_characteristic.health
    @valera.mana = @max_characteristic.mana
    @valera.cheerfulness = @max_characteristic.cheerfulness
    @valera.fatigue = @max_characteristic.fatigue
    @valera.money = @max_characteristic.money
  end

  def die?
    @valera.health <= @min_characteristic.health || @valera.mana <= @min_characteristic.mana || @valera.cheerfulness <= @min_characteristic.cheerfulness || @valera.fatigue <= @min_characteristic.fatigue || @valera.money <= @min_characteristic.money
  end

  def valera_action(action)
    return if can_not_valera_work?(action.name)

    @valera.health += action.health unless heal_valera_in_sleep?(action.name)
    @valera.money += action.money unless get_valera_tips?(action)
    @valera.mana += action.mana
    @valera.cheerfulness += action.cheerfulness unless cheerfulness_valera_in_sleep?(action.name)
    @valera.fatigue += action.fatigue
    self.check_characteristics
  end

  def can_not_valera_work?(action_name)
    action_name == "work" and @valera.mana >= @work_characteristic.mana and @valera.fatigue >= @work_characteristic.fatigue
  end

  def cheerfulness_valera_in_sleep?(action_name)
    action_name == "sleep" and @valera.mana < @sleep_characteristic.cheerfulness_mana
  end

  def heal_valera_in_sleep?(action_name)
    action_name == "sleep" and @valera.mana > @sleep_characteristic.heal_mana
  end

  def get_valera_tips?(action)
    if action.name == "metro" and @valera.mana <= @metro_characteristic.min_mana and @valera.mana >= @metro_characteristic.max_mana
      return false
    end
    @valera.money += @sleep_characteristic.tips + action.money
    return true
  end

  def check_characteristics
    @valera.health = @max_characteristic.health if @valera.health > @max_characteristic.health
    @valera.mana = @max_characteristic.mana if @valera.mana > @max_characteristic.mana
    @valera.cheerfulness = @max_characteristic.cheerfulness if @valera.cheerfulness > @max_characteristic.cheerfulness
    @valera.fatigue = @max_characteristic.fatigue if @valera.fatigue > @max_characteristic.fatigue
  end

  def image_name
    @image = '1'
  end
end