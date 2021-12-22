class Valera < ApplicationRecord
  belongs_to :user
  has_one :min_characteristic
  has_one :max_characteristic
  has_one :action_characteristic
end
